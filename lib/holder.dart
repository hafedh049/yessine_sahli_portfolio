import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/view/contact.dart';
import 'package:yessine/view/ctfs.dart';
import 'package:yessine/view/experience.dart';
import 'package:yessine/view/home.dart';

import 'utils/globals.dart';

class Holder extends StatefulWidget {
  const Holder({super.key});

  @override
  State<Holder> createState() => HolderState();
}

class HolderState extends State<Holder> with SingleTickerProviderStateMixin {
  late final TabController _tabsController;

  final List<Widget> _sections = const <Widget>[Home(), Experience(), Contact(), CTFs()];

  bool _titleState = false;

  final List<String> _tabs = const <String>["Home", "Experience", "Contact", "CTFs"];

  @override
  void initState() {
    _tabsController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            color: headerBgColor,
            height: 60,
            child: Row(
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
                        style: GoogleFonts.jura(fontSize: 20, color: _titleState ? lightBlueColor : whiteColor, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.fade,
                      ),
                    );
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TabBar(
                      controller: _tabsController,
                      automaticIndicatorColorAdjustment: true,
                      dividerColor: transparent,
                      dividerHeight: 0,
                      indicatorColor: lightBlueColor,
                      isScrollable: true,
                      unselectedLabelColor: whiteColor,
                      labelColor: lightBlueColor,
                      tabs: <Widget>[
                        for (final String tab in _tabs) Text(tab, style: GoogleFonts.jura(fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      hoverColor: transparent,
                      splashColor: transparent,
                      highlightColor: transparent,
                      onTap: () async => await launchUrlString("https://drive.google.com/file/d/1O0oq8qSvUini1w0MOy8FmqXQ9FdpSWWU/view?usp=sharing"),
                      child: Text("CV", style: GoogleFonts.jura(fontSize: 16, color: whiteColor, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _tabsController,
              children: _sections,
            ),
          ),
        ],
      ),
    );
  }
}
