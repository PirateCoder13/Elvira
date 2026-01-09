import 'package:elvira/src/config/routes.dart';
import 'package:elvira/src/ui/theme/images/elvira_icon.dart';
import 'package:elvira/src/ui/widgets/bars/top_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:elvira/src/ui/widgets/buttons/pew_buttons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: elviraColorMap[ElviraColor.background],
      appBar: TopStatusBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double gridWidth = constraints.maxWidth;
              final double gridHeight = constraints.maxHeight;
              final double itemHeight =
                  (gridHeight - 40) / 3; // considerando espaçamento
              final double itemWidth = (gridWidth - 40) / 2;

              return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: itemWidth / itemHeight,
                children: [
                  HomeFeatureButton(
                    onPressed:
                        () => Navigator.pushNamed(context, AppRoutes.phone),
                    icon: Image.asset(ElviraIcon.phone.path),
                    label: 'Telefone',
                    backgroundColor: Colors.blue.shade600,
                    textColor: Colors.white,
                  ),
                  HomeFeatureButton(
                    onPressed:
                        () => Navigator.pushNamed(context, AppRoutes.medicine),
                    icon: Image.asset(ElviraIcon.medicine.path),
                    label: 'Medicamentos',
                    backgroundColor: Colors.white,
                    textColor: Colors.orange.shade700,
                    borderColor: Colors.orange.shade700,
                  ),
                  HomeFeatureButton(
                    onPressed:
                        () => Navigator.pushNamed(context, AppRoutes.emergency),
                    icon: Image.asset(ElviraIcon.emergency.path),
                    label: 'Emergência',
                    backgroundColor: Colors.red.shade600,
                    textColor: Colors.white,
                  ),
                  HomeFeatureButton(
                    onPressed:
                        () => Navigator.pushNamed(context, AppRoutes.whatsapp),
                    icon: const Icon(Icons.chat, size: 60, color: Colors.white),
                    label: 'WhatsApp',
                    backgroundColor: const Color(0xFF25D366), // Verde WhatsApp
                    textColor: Colors.white,
                  ),
                  HomeFeatureButton(
                    onPressed:
                        () => Navigator.pushNamed(context, AppRoutes.config),
                    icon: Image.asset(ElviraIcon.cogwheel.path),
                    label: 'Configurações',
                    backgroundColor: Colors.grey.shade400,
                    textColor: Colors.white,
                  ),
                  HomeFeatureButton(
                    onPressed:
                        () =>
                            Navigator.pushNamed(context, AppRoutes.voiceSearch),
                    icon: const Icon(Icons.mic, size: 60, color: Colors.white),
                    label: 'Buscar',
                    backgroundColor: Colors.red.shade600,
                    textColor: Colors.white,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/*-*/

class HomeFeatureButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  const HomeFeatureButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side:
                borderColor != null
                    ? BorderSide(color: borderColor!, width: 3)
                    : BorderSide.none,
          ),
          padding: const EdgeInsets.all(8),
          elevation: 4,
          shadowColor: backgroundColor.withOpacity(0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: icon),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
