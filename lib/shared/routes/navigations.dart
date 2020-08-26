import 'package:flutter/material.dart';

import '../../lib.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeMain:
      return MaterialPageRoute(
        builder: (context) => IdentityFormPage(),
      );
      break;
    default:
      return MaterialPageRoute(
        builder: (context) => IdentityFormPage(),
      );
  }
}
