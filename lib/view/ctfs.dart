import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: _items.isEmpty
          ? Center(child: Text("No CTFs yet.", style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500)))
          : Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 20,
              spacing: 20,
              children: <Widget>[
                for (final Map<String, dynamic> item in _items)
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      AnimatedContainer(
                        width: 250,
                        height: 250,
                        duration: 300.ms,
                        padding: const EdgeInsets.all(48),
                        alignment: Alignment.bottomCenter,
                        child: Text(item["title"], style: GoogleFonts.jura(fontSize: 20, color: whiteColor, fontWeight: FontWeight.w500)),
                      ),
                      Container(decoration: const BoxDecoration(boxShadow: <BoxShadow>[BoxShadow(color: Colors.black, blurStyle: BlurStyle.inner)])),
                    ],
                  ),
              ],
            ),
    );
  }
}
