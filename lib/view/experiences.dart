import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/models/models.dart';
import 'package:yessine/view/blue_sod.dart';
import 'package:yessine/view/loading.dart';

import '../utils/globals.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  List<ExperienceModel> _experiences = <ExperienceModel>[];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: oddDarkBgColor,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Experiences", style: GoogleFonts.jura(fontSize: 35, color: whiteColor, fontWeight: FontWeight.w500)),
          const SizedBox(width: 25),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection("experiences").orderBy("endPeriod", descending: true).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  _experiences = snapshot.data!.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> e) => ExperienceModel.fromJson(e.data())).toList();
                  return _experiences.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              LottieBuilder.asset("assets/lotties/empty.json"),
                              Text("NO EXPERIENCES YET.", style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: _experiences.length,
                          itemBuilder: (BuildContext context, int index) => Container(
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
                                    CachedNetworkImage(imageUrl: _experiences[index].images.first, width: 80, height: 80),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(_experiences[index].poste, style: GoogleFonts.jura(fontSize: 20, color: whiteColor, fontWeight: FontWeight.w500)),
                                          const SizedBox(height: 5),
                                          InkWell(
                                            onTap: () async => await launchUrlString(""),
                                            child: Text(_experiences[index].company, style: GoogleFonts.jura(fontSize: 16, color: blueColor, fontWeight: FontWeight.w500)),
                                          ),
                                          const SizedBox(height: 5),
                                          Text("${formatDate(_experiences[index].startPeriod, const <String>[M, " ", dd, ", ", yyyy])} - ${formatDate(_experiences[index].endPeriod, const <String>[M, " ", dd, ", ", yyyy])}", style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text(_experiences[index].description, style: GoogleFonts.jura(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w500)),
                              ],
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
