import 'package:flutter/material.dart';

import '../lib.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Init Project',
      locale: Locale('en'),
      theme: ThemeData(
        primaryColor: colorBlueMain,
        fontFamily: 'OpenSans',
        backgroundColor: colorWhite,
        accentColor: colorWhite,
        scaffoldBackgroundColor: colorWhite,
      ),
      initialRoute: routeMain,
      onGenerateRoute: generateRoute,
    );
  }
}
