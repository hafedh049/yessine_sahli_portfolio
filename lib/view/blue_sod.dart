import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../utils/globals.dart';

class BlueScreenOfDeath extends StatelessWidget {
  const BlueScreenOfDeath({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: evenDarkBgColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(child: LottieBuilder.asset("assets/lotties/error.json")),
            Text(error, style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
