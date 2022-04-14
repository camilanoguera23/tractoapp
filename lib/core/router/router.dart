import 'package:flutter/material.dart';
import 'package:tractoapp/ui/features/login/login.dart';

import '../../ui/features/gastos/gastos.dart';
import '../../ui/features/home/home.dart';
import '../../ui/features/init/init_screen.dart';
import '../logger/custom_logger.dart';

class CustomRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    CustomLogger.log('=====================================');
    CustomLogger.log('==== ROUTER ====');
    CustomLogger.log('Navigating to route: ${settings.name}');
    CustomLogger.log('Arguments: ${settings.arguments}');
    CustomLogger.log('=====================================');
    switch (settings.name) {
      case InitScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const InitScreen(),
        );
      case Login.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Login(),
        );
      case Home.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Home(),
        );
      case Gastos.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Gastos(),
        );
      default:
        return MaterialPageRoute(settings: settings, builder: (context) => const InitScreen());
    }
  }
}
