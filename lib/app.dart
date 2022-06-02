import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tractoapp/ui/styles/theme.dart';

import 'core/router/router.dart';
import 'ui/features/init/init_screen.dart';

class TractoApp extends StatefulWidget {
  const TractoApp({Key? key}) : super(key: key);

  @override
  State<TractoApp> createState() => _TractoAppState();
}

class _TractoAppState extends State<TractoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme(),
      title: 'TractoApp',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: CustomRouter.onGenerateRoute,
      locale: const Locale('es', 'CO'),
      initialRoute: InitScreen.route,
      debugShowCheckedModeBanner: false,
    );
  }
}
