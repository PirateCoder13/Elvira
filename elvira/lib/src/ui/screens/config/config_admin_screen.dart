import 'package:flutter/material.dart';
import 'package:elvira/src/ui/theme/elvira_colors.dart';

class ConfigAdminScreen extends StatefulWidget {
  const ConfigAdminScreen({super.key});

  @override
  State<ConfigAdminScreen> createState() => _ConfigAdminScreenState();
}

class _ConfigAdminScreenState extends State<ConfigAdminScreen> {
  bool locationTracking = true;
  bool emergencyAlerts = true;
  bool autoAnswerCalls = false;
  String emergencyContact = '+55 11 98765-4321';

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
                      'Config. Administrador',
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
                    _buildSwitchOption(
                      title: 'Rastreamento de Localização',
                      subtitle: 'Permitir rastreamento GPS do idoso',
                      value: locationTracking,
                      onChanged: (value) {
                        setState(() {
                          locationTracking = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildSwitchOption(
                      title: 'Alertas de Emergência',
                      subtitle: 'Receber notificações de SOS',
                      value: emergencyAlerts,
                      onChanged: (value) {
                        setState(() {
                          emergencyAlerts = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildSwitchOption(
                      title: 'Atender Chamadas Automaticamente',
                      subtitle: 'Atende ligações de contatos salvos',
                      value: autoAnswerCalls,
                      onChanged: (value) {
                        setState(() {
                          autoAnswerCalls = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildContactOption(
                      title: 'Contato de Emergência Principal',
                      contact: emergencyContact,
                      onEdit: () {
                        _showEditContactDialog();
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildActionButton(
                      title: 'Alterar Senha de Administrador',
                      icon: Icons.lock,
                      onTap: () {
                        _showChangePasswordDialog();
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildActionButton(
                      title: 'Gerenciar Medicamentos',
                      icon: Icons.medication,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Funcionalidade em desenvolvimento'),
                          ),
                        );
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: elviraColorMap[ElviraColor.onBackground],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
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

  Widget _buildContactOption({
    required String title,
    required String contact,
    required VoidCallback onEdit,
  }) {
    return GestureDetector(
      onTap: onEdit,
      child: Container(
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
            Icon(
              Icons.phone,
              size: 32,
              color: elviraColorMap[ElviraColor.primary],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: elviraColorMap[ElviraColor.onBackground],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    contact,
                    style: TextStyle(
                      fontSize: 18,
                      color: elviraColorMap[ElviraColor.primary],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.edit,
              size: 24,
              color: elviraColorMap[ElviraColor.primary],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            Icon(icon, size: 32, color: elviraColorMap[ElviraColor.primary]),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: elviraColorMap[ElviraColor.onBackground],
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: elviraColorMap[ElviraColor.primary],
            ),
          ],
        ),
      ),
    );
  }

  void _showEditContactDialog() {
    final TextEditingController controller = TextEditingController(
      text: emergencyContact,
    );

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: elviraColorMap[ElviraColor.surface],
            title: Text(
              'Editar Contato',
              style: TextStyle(
                color: elviraColorMap[ElviraColor.onBackground],
                fontWeight: FontWeight.bold,
              ),
            ),
            content: TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              style: TextStyle(
                fontSize: 18,
                color: elviraColorMap[ElviraColor.onBackground],
              ),
              decoration: InputDecoration(
                labelText: 'Número de telefone',
                labelStyle: TextStyle(
                  color: elviraColorMap[ElviraColor.onSurface],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: elviraColorMap[ElviraColor.primary]),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    emergencyContact = controller.text;
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: elviraColorMap[ElviraColor.primary],
                ),
                child: const Text(
                  'Salvar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: elviraColorMap[ElviraColor.surface],
            title: Text(
              'Alterar Senha',
              style: TextStyle(
                color: elviraColorMap[ElviraColor.onBackground],
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text(
              'Funcionalidade de alteração de senha em desenvolvimento.',
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }
}
