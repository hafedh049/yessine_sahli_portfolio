import 'package:flutter/material.dart';

class BlueScreenOfDeath extends StatelessWidget {
  const BlueScreenOfDeath({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[],
      ),
    );
  }
}
