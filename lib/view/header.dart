// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

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
  bool _menuState = false;
  final List<String> _sections = const <String>["Home", "Experience", "Contact", "CTFs"];
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 300.ms,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * (_menuState ? .3 : .1),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: headerBgColor, boxShadow: <BoxShadow>[BoxShadow(blurStyle: BlurStyle.outer, color: whiteColor.withOpacity(.6), offset: const Offset(0, 1))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return window.innerWidth! > 900 ? const SizedBox() : IconButton(onPressed: () => setState(() => _menuState = !_menuState), icon: const Icon(FontAwesome.list_ul_solid, size: 20, color: whiteColor));
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        "Personal Website | Yassine Sahli",
                        style: GoogleFonts.jura(fontSize: 20, color: _titleState ? lightBlueColor : whiteColor, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 30),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return window.innerWidth! <= 900
                      ? const SizedBox()
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
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
                                            controller.animateTo(MediaQuery.sizeOf(context).height * _sections.indexOf(section_) + MediaQuery.sizeOf(context).height * .11, duration: 300.milliseconds, curve: Curves.linear);
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
                            InkWell(
                              hoverColor: transparent,
                              splashColor: transparent,
                              highlightColor: transparent,
                              onTap: () async => await launchUrlString("http://www.google.com"),
                              child: Text("CV", style: GoogleFonts.jura(fontSize: 16, color: whiteColor, fontWeight: FontWeight.w500)),
                            ),
                          ],
                        );
                },
              ),
              const Spacer(),
            ],
          ),
          Expanded(
            child: AnimatedOpacity(
              duration: 300.ms,
              opacity: _menuState ? 1 : 0,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    for (final String section_ in _sections) ...<Widget>[
                      AnimatedScale(
                        duration: 500.ms,
                        scale: section_ == section ? 1.01 : 1,
                        child: InkWell(
                          hoverColor: transparent,
                          splashColor: transparent,
                          highlightColor: transparent,
                          onTap: () async {
                            controller.animateTo(MediaQuery.sizeOf(context).height * _sections.indexOf(section_) + MediaQuery.sizeOf(context).height * .11, duration: 300.milliseconds, curve: Curves.linear);
                            setState(
                              () {
                                section = section_;
                                _menuState = !_menuState;
                              },
                            );
                          },
                          child: Text(section_, style: GoogleFonts.jura(fontSize: 16, color: section_ == section ? lightBlueColor : whiteColor, fontWeight: FontWeight.w500)),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                    InkWell(
                      hoverColor: transparent,
                      splashColor: transparent,
                      highlightColor: transparent,
                      onTap: () async {
                        await launchUrlString("http://www.google.com");
                        setState(() => _menuState = !_menuState);
                      },
                      child: Text("CV", style: GoogleFonts.jura(fontSize: 16, color: whiteColor, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
