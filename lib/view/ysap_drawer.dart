// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../utils/globals.dart';

class YSAPDrawer extends StatefulWidget {
  const YSAPDrawer({super.key});

  @override
  State<YSAPDrawer> createState() => _YSAPDrawerState();
}

class _YSAPDrawerState extends State<YSAPDrawer> {
  final List<Map<String, dynamic>> _tabs = <Map<String, dynamic>>[
    <String, dynamic>{
      "tab": "Home",
      "icon": FontAwesome.house_solid,
      "state": false,
    },
    <String, dynamic>{
      "tab": "Experiences",
      "icon": FontAwesome.house_solid,
      "state": false,
    },
    <String, dynamic>{
      "tab": "Certifications",
      "icon": FontAwesome.certificate_solid,
      "state": false,
    },
    <String, dynamic>{
      "tab": "Projects",
      "icon": FontAwesome.certificate_solid,
      "state": false,
    },
    <String, dynamic>{
      "tab": "CTFs",
      "icon": FontAwesome.gamepad_solid,
      "state": false,
    },
    <String, dynamic>{
      "tab": "Contact",
      "icon": FontAwesome.diagram_project_solid,
      "state": false,
    },
  ];

  bool _cvState = false;

  List<int> _items = <int>[];
  final List<String> _fields = const <String>["Days", "Hrs", "Mns", "Scs"];

  late final Timer _timer;

  final GlobalKey<State<StatefulWidget>> _counterKey = GlobalKey<State<StatefulWidget>>();

  @override
  void initState() {
    _timer = Timer.periodic(1.seconds, (Timer _) => _counterKey.currentState!.setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: headerBgColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) setS) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    for (Map<String, dynamic> item in _tabs) ...<Widget>[
                      InkWell(
                        splashColor: transparent,
                        highlightColor: transparent,
                        focusColor: transparent,
                        hoverColor: transparent,
                        onHover: (bool value) => setS(() => item["state"] = value),
                        onTap: () async {
                          setS(() => currentTab = _tabs.indexOf(item));
                          tabsController.animateTo(currentTab, duration: 500.ms, curve: Curves.linear);
                          Navigator.pop(context);
                        },
                        child: AnimatedContainer(
                          duration: 200.ms,
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: currentTab == _tabs.indexOf(item) || item["state"] ? blueColor.withOpacity(.4) : transparent),
                          child: Row(
                            children: <Widget>[
                              Icon(item["icon"], size: 10, color: currentTab == _tabs.indexOf(item) || item["state"] ? blueColor : whiteColor),
                              const SizedBox(width: 10),
                              AnimatedDefaultTextStyle(
                                duration: 200.ms,
                                style: GoogleFonts.jura(fontSize: 16, color: currentTab == _tabs.indexOf(item) || item["state"] ? blueColor : whiteColor, fontWeight: FontWeight.w500),
                                child: Text(item["tab"]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                    StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance.collection("cvs").doc("X8aLQxW7L90jvOiYFm9f").snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                        return InkWell(
                          splashColor: transparent,
                          highlightColor: transparent,
                          focusColor: transparent,
                          hoverColor: transparent,
                          onHover: (bool value) => setS(() => _cvState = value),
                          onTap: snapshot.hasData ? () async => await launchUrlString(snapshot.data!.get("cv")) : null,
                          child: AnimatedContainer(
                            duration: 200.ms,
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: _cvState ? blueColor.withOpacity(.4) : transparent),
                            child: Row(
                              children: <Widget>[
                                Icon(FontAwesome.paperclip_solid, size: 10, color: _cvState ? blueColor : whiteColor),
                                const SizedBox(width: 10),
                                AnimatedDefaultTextStyle(
                                  duration: 200.ms,
                                  style: GoogleFonts.jura(fontSize: 16, color: _cvState ? blueColor : whiteColor, fontWeight: FontWeight.w500),
                                  child: const Text("CV"),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            const SizedBox(height: 20),
            Center(
              child: Card(
                color: headerBgColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: StatefulBuilder(
                  key: _counterKey,
                  builder: (BuildContext context, void Function(void Function()) setS) {
                    final Duration difference = DateTime.now().difference(creationDate);

                    final int days = difference.inDays;
                    final int hours = difference.inHours % 24;
                    final int minutes = difference.inMinutes % 60;
                    final int seconds = difference.inSeconds % 60;

                    _items = <int>[days, hours, minutes, seconds];
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (final int item in _items) ...<Widget>[
                          Container(
                            padding: const EdgeInsets.all(2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("$item", style: GoogleFonts.jura(fontSize: 12, color: whiteColor, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 5),
                                Text(_fields[_items.indexOf(item)], style: GoogleFonts.jura(fontSize: 8, color: whiteColor, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          if (item != _items.last) Text(" : ", style: GoogleFonts.jura(fontSize: 12, color: whiteColor, fontWeight: FontWeight.bold)),
                        ],
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
