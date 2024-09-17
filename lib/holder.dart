import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/view/contact.dart';
import 'package:yessine/view/ctfs.dart';
import 'package:yessine/view/experiences.dart';
import 'package:yessine/view/home.dart';
import 'package:yessine/view/projects.dart';
import 'package:yessine/view/ysap_drawer.dart';

import 'utils/globals.dart';
import 'view/certifications.dart';

class Holder extends StatefulWidget {
  const Holder({super.key});

  @override
  State<Holder> createState() => HolderState();
}

class HolderState extends State<Holder> with TickerProviderStateMixin {
  final List<Widget> _sections = const <Widget>[Home(), Experiences(), Certifications(), Projects(), CTFs(), Contact()];

  bool _titleState = false;

  final List<String> _tabs = const <String>["Home", "Experience", "Certifications", "Projects", "CTFs", "Contact"];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final AnimationController _drawerController;

  @override
  void initState() {
    _drawerController = AnimationController(vsync: this, duration: 1.seconds);
    tabsController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabsController.dispose();
    _drawerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      onDrawerChanged: (bool isOpened) async => isOpened ? _drawerController.forward() : _drawerController.reverse(),
      drawer: const YSAPDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.sizeOf(context).width,
                color: headerBgColor,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _drawerController, size: 20, color: whiteColor),
                    ),
                    const SizedBox(width: 5),
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
                    constraints.maxWidth < 1150
                        ? const SizedBox()
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              TabBar(
                                controller: tabsController,
                                automaticIndicatorColorAdjustment: true,
                                dividerColor: transparent,
                                dividerHeight: 0,
                                indicatorColor: lightBlueColor,
                                isScrollable: true,
                                unselectedLabelColor: whiteColor,
                                labelColor: lightBlueColor,
                                tabs: <Widget>[for (final String tab in _tabs) Text(tab, style: GoogleFonts.jura(fontSize: 16, fontWeight: FontWeight.w500))],
                              ),
                              const SizedBox(width: 20),
                              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                                stream: FirebaseFirestore.instance.collection("cvs").doc("X8aLQxW7L90jvOiYFm9f").snapshots(),
                                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                                  return InkWell(
                                    hoverColor: transparent,
                                    splashColor: transparent,
                                    highlightColor: transparent,
                                    onTap: snapshot.hasData ? () async => await launchUrlString(snapshot.data!.get("cv")) : null,
                                    child: Text("CV", style: GoogleFonts.jura(fontSize: 16, color: whiteColor, fontWeight: FontWeight.w500)),
                                  );
                                },
                              ),
                            ],
                          ),
                    const SizedBox(width: 20),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: tabsController,
              children: _sections,
            ),
          ),
        ],
      ),
    );
  }
}
