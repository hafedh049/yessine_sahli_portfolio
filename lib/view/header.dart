import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yessine/shared/globals.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _titleState = false;
  final List<Map<String,dynamic>> _sections = <Map<String,dynamic>>[

    <String,dynamic>{

  }];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) _) {
              return InkWell(
                hoverColor: transparent,
                splashColor: transparent,
                highlightColor: transparent,
                onTap: () => true,
                onHover: (bool value) => _(() => _titleState = value),
                child: Text(
                  "Personal Website | Yassine Sahli",
                  style: GoogleFonts.jura(fontSize: 35, color: _titleState ? lightBlueColor : whiteColor, fontWeight: FontWeight.w500),
                ),
              );
            },
          ),
          const SizedBox(width: 30),
          for()...<Widget>[ StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) _) {
              return InkWell(
                hoverColor: transparent,
                splashColor: transparent,
                highlightColor: transparent,
                onTap: () => true,
                onHover: (bool value) => _(() => _titleState = value),
                child: Text(
                  "Personal Website | Yassine Sahli",
                  style: GoogleFonts.jura(fontSize: 35, color: _titleState ? lightBlueColor : whiteColor, fontWeight: FontWeight.w500),
                ),
              );
            },
          ),const SizedBox(width: 20),],
          const Spacer(),
        ],
      ),
    );
  }
}
