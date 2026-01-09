import 'package:flutter/material.dart';
import 'package:elvira/src/ui/theme/elvira_colors.dart';

class ConfigElderlyScreen extends StatefulWidget {
  const ConfigElderlyScreen({super.key});

  @override
  State<ConfigElderlyScreen> createState() => _ConfigElderlyScreenState();
}

class _ConfigElderlyScreenState extends State<ConfigElderlyScreen> {
  double fontSize = 18.0;
  bool soundEnabled = true;
  bool vibrationEnabled = true;
  double brightness = 0.8;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: elviraColorMap[ElviraColor.background],
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 36),
                    color: elviraColorMap[ElviraColor.primary],
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Configurações do Idoso',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: elviraColorMap[ElviraColor.onBackground],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: [
                    _buildSliderOption(
                      title: 'Tamanho da Fonte',
                      value: fontSize,
                      min: 14.0,
                      max: 28.0,
                      divisions: 7,
                      label: '${fontSize.toInt()}',
                      onChanged: (value) {
                        setState(() {
                          fontSize = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildSwitchOption(
                      title: 'Sons',
                      subtitle: 'Ativar sons do aplicativo',
                      value: soundEnabled,
                      onChanged: (value) {
                        setState(() {
                          soundEnabled = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildSwitchOption(
                      title: 'Vibração',
                      subtitle: 'Ativar vibração ao tocar',
                      value: vibrationEnabled,
                      onChanged: (value) {
                        setState(() {
                          vibrationEnabled = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildSliderOption(
                      title: 'Brilho da Tela',
                      value: brightness,
                      min: 0.3,
                      max: 1.0,
                      divisions: 7,
                      label: '${(brightness * 100).toInt()}%',
                      onChanged: (value) {
                        setState(() {
                          brightness = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliderOption({
    required String title,
    required double value,
    required double min,
    required double max,
    required int divisions,
    required String label,
    required ValueChanged<double> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: elviraColorMap[ElviraColor.surface],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: elviraColorMap[ElviraColor.primary] ?? Colors.blue,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: elviraColorMap[ElviraColor.onBackground],
            ),
          ),
          const SizedBox(height: 8),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            label: label,
            activeColor: elviraColorMap[ElviraColor.primary],
            onChanged: onChanged,
          ),
          Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: elviraColorMap[ElviraColor.primary],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchOption({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: elviraColorMap[ElviraColor.surface],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: elviraColorMap[ElviraColor.primary] ?? Colors.blue,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: elviraColorMap[ElviraColor.onBackground],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: elviraColorMap[ElviraColor.onSurface],
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            activeColor: elviraColorMap[ElviraColor.primary],
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
