import 'package:elvira/src/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:elvira/src/ui/theme/elvira_colors.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

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
                      'Configurações',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: elviraColorMap[ElviraColor.onBackground],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildConfigOption(
                      context: context,
                      icon: Icons.person,
                      title: 'Configurações do Idoso',
                      subtitle: 'Ajustes básicos e preferências',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.configElderly);
                      },
                    ),
                    const SizedBox(height: 24),
                    _buildConfigOption(
                      context: context,
                      icon: Icons.admin_panel_settings,
                      title: 'Configurações de Administrador',
                      subtitle: 'Requer senha - Ajustes avançados',
                      onTap: () {
                        _showPasswordDialog(context);
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

  Widget _buildConfigOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: elviraColorMap[ElviraColor.surface],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: elviraColorMap[ElviraColor.primary] ?? Colors.blue,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 48, color: elviraColorMap[ElviraColor.primary]),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
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
            Icon(
              Icons.arrow_forward_ios,
              size: 24,
              color: elviraColorMap[ElviraColor.primary],
            ),
          ],
        ),
      ),
    );
  }

  void _showPasswordDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    bool obscureText = true;

    showDialog(
      context: context,
      builder:
          (dialogContext) => StatefulBuilder(
            builder:
                (context, setState) => AlertDialog(
                  backgroundColor: elviraColorMap[ElviraColor.surface],
                  title: Text(
                    'Senha de Administrador',
                    style: TextStyle(
                      color: elviraColorMap[ElviraColor.onBackground],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Digite a senha para acessar as configurações de administrador:',
                        style: TextStyle(
                          color: elviraColorMap[ElviraColor.onBackground],
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: passwordController,
                        obscureText: obscureText,
                        style: TextStyle(
                          fontSize: 18,
                          color: elviraColorMap[ElviraColor.onBackground],
                        ),
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(
                            color: elviraColorMap[ElviraColor.onSurface],
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: elviraColorMap[ElviraColor.onSurface],
                            ),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(dialogContext),
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
                        if (passwordController.text == 'senha') {
                          Navigator.pop(dialogContext);
                          Navigator.pushNamed(context, AppRoutes.configAdmin);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Senha incorreta!',
                                style: TextStyle(fontSize: 16),
                              ),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: elviraColorMap[ElviraColor.primary],
                      ),
                      child: const Text(
                        'Confirmar',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
          ),
    );
  }
}
