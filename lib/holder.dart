import 'package:flutter/material.dart';
import 'package:yessine/view/home.dart';
import 'package:yessine/view/space.dart';

import 'view/header.dart';

class Holder extends StatefulWidget {
  const Holder({super.key});

  @override
  State<Holder> createState() => _HolderState();
}

class _HolderState extends State<Holder> {
  final List<Widget> _sections = <Widget>[
    const Space(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          const Header(),
          Positioned.fill(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _sections.length,
              itemBuilder: (BuildContext context, int index) => _sections[index],
            ),
          ),
        ],
      ),
    );
  }
}
