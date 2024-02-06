import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yessine/shared/globals.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height * .2,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("all rights reserved © 2023", style: GoogleFonts.jura(fontSize: 16, color: darkGreyColor, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Published with ", style: GoogleFonts.jura(fontSize: 16, color: darkGreyColor, fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}
