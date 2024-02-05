import 'package:flutter/material.dart';
import 'package:yessine/shared/globals.dart';

class Space extends StatelessWidget {
  const Space({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height * .2,
      color: oddDarkBgColor,
    );
  }
}
