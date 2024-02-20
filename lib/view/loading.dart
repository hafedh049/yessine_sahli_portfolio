import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../shared/globals.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: evenDarkBgColor,
      body: Center(child: LottieBuilder.asset("assets/lotties/loading.json", width: 300, height: 300)),
    );
  }
}
