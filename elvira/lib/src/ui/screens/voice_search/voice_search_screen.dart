import 'package:flutter/material.dart';
import 'package:elvira/src/ui/theme/elvira_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class VoiceSearchScreen extends StatelessWidget {
  const VoiceSearchScreen({super.key});

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
                      'Busca por Voz',
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mic, size: 120, color: Colors.red.shade600),
                      const SizedBox(height: 30),
                      Text(
                        'Google Busca por Voz',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: elviraColorMap[ElviraColor.onBackground],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Fale sua busca',
                        style: TextStyle(
                          fontSize: 18,
                          color: elviraColorMap[ElviraColor.onSurface],
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () => _openGoogleVoiceSearch(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade600,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 24,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 8,
                        ),
                        child: const Text(
                          'Iniciar Busca',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: elviraColorMap[ElviraColor.surface],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                elviraColorMap[ElviraColor.primary] ??
                                Colors.blue,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'Pressione o botão e fale\naquilo que deseja buscar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: elviraColorMap[ElviraColor.onBackground],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openGoogleVoiceSearch(BuildContext context) async {
    // Intent para Google Busca por Voz
    final Uri googleVoiceIntent = Uri(
      scheme: 'https',
      host: 'www.google.com',
      queryParameters: {'q': 'voice_search'},
    );

    // Para Android nativo, usar a intent do Google Assistant
    final Uri androidIntent = Uri(
      scheme: 'intent',
      path:
          '#Intent;action=com.google.android.gms.actions.SEARCH_ACTION;S.query=;end',
    );

    try {
      // Tenta abrir a busca por voz do Google
      if (await canLaunchUrl(googleVoiceIntent)) {
        await launchUrl(
          googleVoiceIntent,
          mode: LaunchMode.externalApplication,
        );
      } else {
        // Fallback: abre o Google
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Abrindo Google Busca...',
                style: TextStyle(fontSize: 16),
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
        if (await canLaunchUrl(googleVoiceIntent)) {
          await launchUrl(googleVoiceIntent);
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Erro ao abrir busca: $e',
              style: const TextStyle(fontSize: 16),
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
