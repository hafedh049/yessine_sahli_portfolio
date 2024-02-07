import 'package:flutter/material.dart';
import 'package:yessine/view/contact.dart';
import 'package:yessine/view/ctfs.dart';
import 'package:yessine/view/experience.dart';
import 'package:yessine/view/footer.dart';
import 'package:yessine/view/home.dart';
import 'package:yessine/view/space.dart';

import 'shared/globals.dart';
import 'view/header.dart';

class Holder extends StatefulWidget {
  const Holder({super.key});

  @override
  State<Holder> createState() => _HolderState();
}

class _HolderState extends State<Holder> {
  final List<Widget> _sections = const <Widget>[Space(), Home(), Experience(), Contact(), CTFs(), Footer()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          ListView.builder(
            controller: controller,
            padding: EdgeInsets.zero,
            itemCount: _sections.length,
            itemBuilder: (BuildContext context, int index) => _sections[index],
          ),
          const Header(),
        ],
      ),
    );
  }
}
