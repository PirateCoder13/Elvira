import 'dart:async';
import 'package:elvira/src/ui/widgets/bars/notification_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:battery_plus/battery_plus.dart';

class TopStatusBar extends StatefulWidget implements PreferredSizeWidget {
  const TopStatusBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(250.0);

  @override
  State<TopStatusBar> createState() => _TopStatusBarState();
}

class _TopStatusBarState extends State<TopStatusBar> {
  late Timer _timer;
  String _currentTime = '';
  int _batteryLevel = 0;
  String _connectionStatus = '...';

  final Battery _battery = Battery();
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    _updateAll();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) => _updateAll());
  }

  Future<void> _updateAll() async {
    final now = DateTime.now();
    final formattedTime = DateFormat('HH:mm').format(now);
    final battery = await _battery.batteryLevel;
    final conn = await _connectivity.checkConnectivity();

    setState(() {
      _currentTime = formattedTime;
      _batteryLevel = battery;
      _connectionStatus = _getConnectionLabel(conn);
    });
  }

  String _getConnectionLabel(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.wifi)) {
      return 'Wi-Fi';
    } else if (result.contains(ConnectivityResult.mobile)) {
      return '4G';
    } else if (result.contains(ConnectivityResult.none)) {
      return 'Sem sinal';
    } else {
      return '...';
    }
  }

  Color _getBatteryColor(int level) {
    if (level >= 50) {
      return Colors.green; // Verde para 50% ou mais
    } else if (level >= 30) {
      return Colors.amber; // Amarelo para 30-49%
    } else if (level >= 20) {
      return Colors.orange; // Laranja para 20-29%
    } else {
      return Colors.red; // Vermelho para menos de 20%
    }
  }

  IconData _getBatteryIcon(int level) {
    if (level >= 90) return Icons.battery_full;
    if (level >= 70) return Icons.battery_6_bar;
    if (level >= 50) return Icons.battery_5_bar;
    if (level >= 30) return Icons.battery_4_bar;
    if (level >= 20) return Icons.battery_3_bar;
    return Icons.battery_alert;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),

      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _currentTime,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    _connectionStatus,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Column(
                children: [
                  Icon(
                    _getBatteryIcon(_batteryLevel),
                    color: _getBatteryColor(_batteryLevel),
                    size: 100,
                  ),
                  Text(
                    '$_batteryLevel%',
                    style: TextStyle(
                      color: _getBatteryColor(_batteryLevel),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 1),
              NotificationBar(),
            ],
          ),
        ],
      ),
    );
  }
}
