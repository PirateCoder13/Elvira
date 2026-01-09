import 'package:elvira/src/ui/screens/phone/call_history_screen.dart';
import 'package:elvira/src/ui/screens/phone/contact_management_screen.dart';
import 'package:elvira/src/ui/screens/phone/contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:elvira/src/ui/screens/main_screen.dart';
import 'package:elvira/src/ui/screens/phone/phone_screen.dart';
import 'package:elvira/src/ui/screens/phone/dial_pad.dart';
import 'package:elvira/src/ui/screens/medicine/medicines_screen.dart';
import 'package:elvira/src/ui/screens/emergency/emergency_screen.dart';
import 'package:elvira/src/ui/screens/config/config_screen.dart';
import 'package:elvira/src/ui/screens/config/config_elderly_screen.dart';
import 'package:elvira/src/ui/screens/config/config_admin_screen.dart';
import 'package:elvira/src/ui/screens/whatsapp/whatsapp_screen.dart';
import 'package:elvira/src/ui/screens/voice_search/voice_search_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String phone = '/phone';
  static const String dialPad = '/phone/dial_pad';
  static const String callHistory = '/phone/call_history_screen';
  static const String contacts = '/phone/contacts';
  static const String contactManagement = '/phone/contact_management_screen';
  static const String medicine = '/medicine';
  static const String emergency = '/emergency';
  static const String config = '/config';
  static const String configElderly = '/config/elderly';
  static const String configAdmin = '/config/admin';
  static const String whatsapp = '/whatsapp';
  static const String voiceSearch = '/voice_search';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case phone:
        return MaterialPageRoute(builder: (_) => const PhoneScreen());
      case dialPad:
        return MaterialPageRoute(builder: (_) => const PhoneDialScreen());
      case callHistory:
        return MaterialPageRoute(builder: (_) => const CallHistoryScreen());
      case contacts:
        return MaterialPageRoute(builder: (_) => const ContactsScreen());
      case contactManagement:
        return MaterialPageRoute(
          builder: (_) => const ContactManagementScreen(),
        );
      case medicine:
        return MaterialPageRoute(builder: (_) => const MedicinesScreen());
      case config:
        return MaterialPageRoute(builder: (_) => const ConfigScreen());
      case configElderly:
        return MaterialPageRoute(builder: (_) => const ConfigElderlyScreen());
      case configAdmin:
        return MaterialPageRoute(builder: (_) => const ConfigAdminScreen());
      case emergency:
        return MaterialPageRoute(builder: (_) => const EmergencyScreen());
      case whatsapp:
        return MaterialPageRoute(builder: (_) => const WhatsappScreen());
      case voiceSearch:
        return MaterialPageRoute(builder: (_) => const VoiceSearchScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text('Tela "${settings.name}" não existe')),
              ),
        );
    }
  }
}
