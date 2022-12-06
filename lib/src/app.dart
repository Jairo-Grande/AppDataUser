import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/routes/routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        title: 'Material App',
        initialRoute: 'home',
        routes: appRoutes,
        supportedLocales: const [Locale('es', 'ES')]);
  }
}
