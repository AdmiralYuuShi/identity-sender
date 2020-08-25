import 'package:flutter/material.dart';

import '../../../lib.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarDefault(
        title: 'Initial Project',
        withoutBack: true,
      ),
      body: Center(
        child: Text20Atm(
          text: 'Welcome to Initial Flutter Project',
        ),
      ),
    );
  }
}
