import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yessine/shared/globals.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.callback});
  final Function() callback;
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _titleState = false;
  bool _sectionState = false;

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
                    onTap: widget.callback,
                    onHover: (bool value) => _(() => _sectionState = value),
                    child: Text(section_, style: GoogleFonts.jura(fontSize: 16, color: section_ == section ? lightBlueColor : whiteColor, fontWeight: FontWeight.w500)),
                  ),
                );
              },
            ),
            const SizedBox(width: 20),
          ],
          StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) _) {
              return AnimatedScale(
                duration: 500.ms,
                scale: _sectionState ? 1.01 : 1,
                child: InkWell(
                  hoverColor: transparent,
                  splashColor: transparent,
                  highlightColor: transparent,
                  onTap: widget.callback,
                  onHover: (bool value) => _(() => _sectionState = value),
                  child: Text("CV", style: GoogleFonts.jura(fontSize: 16, color: whiteColor, fontWeight: FontWeight.w500)),
                ),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
