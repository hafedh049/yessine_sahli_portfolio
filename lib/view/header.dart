import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yessine/shared/globals.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _titleState = false;
  late final List<Map<String, dynamic>> _sections;
  @override
  void initState() {
    _sections = <Map<String, dynamic>>[
      <String, dynamic>{
        "title": "Home",
        "state": false,
        "callback": () {},
      },
      <String, dynamic>{
        "title": "Experience",
        "state": false,
        "callback": () {},
      },
      <String, dynamic>{
        "title": "Contact",
        "state": false,
        "callback": () {},
      },
      <String, dynamic>{
        "title": "CTFs",
        "state": false,
        "callback": () {},
      },
      <String, dynamic>{
        "title": "CV",
        "state": false,
        "callback": () {},
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * .1,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: headerBgColor,
        boxShadow: <BoxShadow>[BoxShadow(blurStyle: BlurStyle.outer, color: whiteColor.withOpacity(.6), offset: const Offset(0, 1))],
      ),
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
          for (Map<String, dynamic> section in _sections) ...<Widget>[
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return AnimatedScale(
                  duration: 500.ms,
                  scale: section["state"] ? 1.01 : 1,
                  child: InkWell(
                    hoverColor: transparent,
                    splashColor: transparent,
                    highlightColor: transparent,
                    onTap: () => true,
                    onHover: (bool value) => _(() => section["state"] = value),
                    child: Text(
                      section["title"],
                      style: GoogleFonts.jura(fontSize: 20, color: section["state"] ? lightBlueColor : whiteColor, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 20),
          ],
          const Spacer(),
        ],
      ),
    );
  }
}
