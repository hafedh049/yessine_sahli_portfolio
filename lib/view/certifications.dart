import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/models/models.dart';
import 'package:yessine/view/loading.dart';

import '../utils/globals.dart';
import 'blue_sod.dart';

class Certifications extends StatefulWidget {
  const Certifications({super.key});

  @override
  State<Certifications> createState() => _CertificationsState();
}

class _CertificationsState extends State<Certifications> {
  List<CertificationModel> _certifs = <CertificationModel>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
      color: oddDarkBgColor,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Certifications", style: GoogleFonts.jura(fontSize: 35, color: whiteColor, fontWeight: FontWeight.w500)),
                const SizedBox(width: 20),
                /*HAKJKJ*/
              ],
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection("certifications").snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  _certifs = snapshot.data!.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> e) => CertificationModel.fromJson(e.data())).toList();
                  return _certifs.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              LottieBuilder.asset("assets/lotties/empty.json"),
                              Text("NO CERTIFICATIONS YET.", style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        )
                      : ListView(
                          children: <Widget>[
                            Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runAlignment: WrapAlignment.center,
                              runSpacing: 20,
                              spacing: 20,
                              children: <Widget>[
                                for (final CertificationModel certif in _certifs)
                                  InkWell(
                                    onTap: () => launchUrlString(certif.url),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width: 250,
                                          height: 250,
                                          padding: const EdgeInsets.all(24),
                                          alignment: Alignment.bottomCenter,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: blueColor),
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(image: CachedNetworkImageProvider(certif.images.first), fit: BoxFit.cover),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Container(
                                                color: lightBlueColor.withOpacity(.3),
                                                padding: const EdgeInsets.all(8),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                                  child: Text(certif.title, style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.bold)),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(certif.validationPeriod, style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          ],
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
