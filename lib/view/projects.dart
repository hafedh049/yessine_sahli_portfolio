import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/models/models.dart';

import '../utils/globals.dart';
import 'blue_sod.dart';
import 'loading.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  List<ProjectModel> _projects = <ProjectModel>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: oddDarkBgColor,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Projects", style: GoogleFonts.jura(fontSize: 35, color: whiteColor, fontWeight: FontWeight.w500)),
          const SizedBox(height: 25),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection("projects").orderBy("endPeriod", descending: true).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  _projects = snapshot.data!.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> e) => ProjectModel.fromJson(e.data())).toList();
                  return _projects.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              LottieBuilder.asset("assets/lotties/empty.json"),
                              Text("NO PROJECTS YET.", style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: _projects.length,
                          itemBuilder: (BuildContext context, int index) => InkWell(
                            splashColor: transparent,
                            highlightColor: transparent,
                            hoverColor: transparent,
                            focusColor: transparent,
                            onTap: () => launchUrlString(_projects[index].url),
                            child: Container(
                              margin: const EdgeInsets.all(24),
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: darkGreyColor.withOpacity(.2)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      CachedNetworkImage(imageUrl: _projects[index].images.first, width: 80, height: 80),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(_projects[index].name, style: GoogleFonts.jura(fontSize: 20, color: whiteColor, fontWeight: FontWeight.w500)),
                                            const SizedBox(height: 5),
                                            Text(
                                              "${formatDate(_projects[index].startPeriod, const <String>[M, " ", dd, ", ", yyyy])} - ${formatDate(_projects[index].endPeriod, const <String>[M, " ", dd, ", ", yyyy])}",
                                              style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Text(_projects[index].description, style: GoogleFonts.jura(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Loading();
                } else {
                  return BlueScreenOfDeath(error: snapshot.error.toString());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
