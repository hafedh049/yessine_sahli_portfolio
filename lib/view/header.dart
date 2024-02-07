import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/shared/globals.dart';

class Header extends StatefulWidget {
  const Header({super.key});
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _titleState = false;
  bool _sectionState = false;

  final List<String> _sections = <String>["Home", "Experience", "Contact", "CTFs", "CV"];
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
                child: Text("Personal Website | Yassine Sahli", style: GoogleFonts.jura(fontSize: 25, color: _titleState ? lightBlueColor : whiteColor, fontWeight: FontWeight.w500)),
              );
            },
          ),
          const SizedBox(width: 30),
          for (final String section_ in _sections) ...<Widget>[
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return AnimatedScale(
                  duration: 500.ms,
                  scale: section_ == section || _sectionState ? 1.01 : 1,
                  child: InkWell(
                    hoverColor: transparent,
                    splashColor: transparent,
                    highlightColor: transparent,
                    onTap: () async {
                      if (pageController.page!.toInt() == _sections.length - 1) {
                        await launchUrlString("www.google.com");
                      } else if (pageController.page!.toInt() != _sections.indexOf(section)) {
                        pageController.jumpToPage(_sections.indexOf(section));
                        _(() => section = section_);
                      }
                    },
                    onHover: (bool value) => _(() => _sectionState = value),
                    child: Text(section_, style: GoogleFonts.jura(fontSize: 16, color: section_ == section || _sectionState ? lightBlueColor : whiteColor, fontWeight: FontWeight.w500)),
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
