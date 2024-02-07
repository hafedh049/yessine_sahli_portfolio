import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../shared/globals.dart';

class CTFs extends StatefulWidget {
  const CTFs({super.key});

  @override
  State<CTFs> createState() => _CTFsState();
}

class _CTFsState extends State<CTFs> {
  final List<Map<String, dynamic>> _items = <Map<String, dynamic>>[];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: oddDarkBgColor,
      alignment: Alignment.center,
      constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        runSpacing: 20,
        spacing: 20,
        children: <Widget>[
          for (final Map<String, dynamic> item in _items)
            AnimatedContainer(
              duration: 300.ms,
              child: Column(
                children: <Widget>[],
              ),
            ),
        ],
      ),
    );
  }
}
