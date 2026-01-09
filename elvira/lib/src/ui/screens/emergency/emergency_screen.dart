import 'package:elvira/src/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:elvira/src/ui/theme/elvira_colors.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

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
                  Text(
                    'Emergência',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: elviraColorMap[ElviraColor.onBackground],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Botão SOS Grande
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showSOSConfirmation(context);
                  },
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'SOS',
                        style: TextStyle(
                          fontSize: 54,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Números de Emergência',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: elviraColorMap[ElviraColor.onBackground],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildEmergencyButton(
                      number: '192',
                      service: 'Ambulância',
                      icon: Icons.local_hospital,
                      onTap:
                          () => _showCallConfirmation(
                            context,
                            '192',
                            'Ambulância',
                          ),
                    ),
                    _buildEmergencyButton(
                      number: '190',
                      service: 'Polícia Militar',
                      icon: Icons.security,
                      onTap:
                          () => _showCallConfirmation(
                            context,
                            '190',
                            'Polícia Militar',
                          ),
                    ),
                    _buildEmergencyButton(
                      number: '193',
                      service: 'Bombeiros',
                      icon: Icons.fire_truck,
                      onTap:
                          () => _showCallConfirmation(
                            context,
                            '193',
                            'Bombeiros',
                          ),
                    ),
                    _buildEmergencyButton(
                      number: '100',
                      service: 'Polícia Civil',
                      icon: Icons.badge,
                      onTap:
                          () => _showCallConfirmation(
                            context,
                            '100',
                            'Polícia Civil',
                          ),
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

  Widget _buildEmergencyButton({
    required String number,
    required String service,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: elviraColorMap[ElviraColor.surface],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red, width: 2),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.red),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: elviraColorMap[ElviraColor.onBackground],
                    ),
                  ),
                  Text(
                    number,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.phone_in_talk, size: 32, color: Colors.red),
          ],
        ),
      ),
    );
  }

  void _showSOSConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: elviraColorMap[ElviraColor.surface],
            title: Text(
              'Confirmar SOS',
              style: TextStyle(
                color: elviraColorMap[ElviraColor.onBackground],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'Você ativou o botão SOS. Deseja realmente enviar uma mensagem de emergência?',
              style: TextStyle(
                color: elviraColorMap[ElviraColor.onBackground],
                fontSize: 18,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    color: elviraColorMap[ElviraColor.primary],
                    fontSize: 16,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showSOSActivated(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  'Confirmar SOS',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
    );
  }

  void _showCallConfirmation(
    BuildContext context,
    String number,
    String service,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: elviraColorMap[ElviraColor.surface],
            title: Text(
              'Ligar para $service?',
              style: TextStyle(
                color: elviraColorMap[ElviraColor.onBackground],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'Número: $number',
              style: TextStyle(
                color: elviraColorMap[ElviraColor.onBackground],
                fontSize: 18,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    color: elviraColorMap[ElviraColor.primary],
                    fontSize: 16,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Ligando para $service ($number)...',
                        style: const TextStyle(fontSize: 16),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  'Ligar',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
    );
  }

  void _showSOSActivated(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            backgroundColor: elviraColorMap[ElviraColor.surface],
            title: Text(
              'SOS Ativado!',
              style: TextStyle(
                color: Colors.red,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'Mensagem de emergência enviada para seus contatos.',
              style: TextStyle(
                color: elviraColorMap[ElviraColor.onBackground],
                fontSize: 18,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
    );
  }
}
