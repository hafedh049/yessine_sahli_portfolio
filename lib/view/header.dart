import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/shared/globals.dart';

class Header extends StatefulWidget {
  const Header({super.key});
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _titleState = false;

  final List<String> _sections = <String>["Home", "Experience", "Contact", "CTFs"];
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 300.ms,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * .1,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: headerBgColor, boxShadow: <BoxShadow>[BoxShadow(blurStyle: BlurStyle.outer, color: whiteColor.withOpacity(.6), offset: const Offset(0, 1))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return IconButton(onPressed: () {}, icon: const Icon(FontAwesome.list_ul_solid, size: 25, color: whiteColor));
                },
              ),
              StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return InkWell(
                    hoverColor: transparent,
                    splashColor: transparent,
                    highlightColor: transparent,
                    onTap: () => true,
                    onHover: (bool value) => _(() => _titleState = value),
                    child: Text("Personal Website | Yassine Sahli", style: GoogleFonts.jura(fontSize: 22, color: _titleState ? lightBlueColor : whiteColor, fontWeight: FontWeight.w500)),
                  );
                },
              ),
              const SizedBox(width: 30),
              StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      for (final String section_ in _sections) ...<Widget>[
                        AnimatedScale(
                          duration: 500.ms,
                          scale: section_ == section ? 1.01 : 1,
                          child: InkWell(
                            hoverColor: transparent,
                            splashColor: transparent,
                            highlightColor: transparent,
                            onTap: () async {
                              controller.animateTo(MediaQuery.sizeOf(context).height * _sections.indexOf(section_) + MediaQuery.sizeOf(context).height * .1, duration: 300.milliseconds, curve: Curves.linear);
                              _(() => section = section_);
                            },
                            child: Text(section_, style: GoogleFonts.jura(fontSize: 16, color: section_ == section ? lightBlueColor : whiteColor, fontWeight: FontWeight.w500)),
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ],
                  );
                },
              ),
              StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return InkWell(
                    hoverColor: transparent,
                    splashColor: transparent,
                    highlightColor: transparent,
                    onTap: () async => await launchUrlString("http://www.google.com"),
                    child: Text("CV", style: GoogleFonts.jura(fontSize: 16, color: whiteColor, fontWeight: FontWeight.w500)),
                  );
                },
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
