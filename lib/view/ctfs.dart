import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/view/blue_sod.dart';
import 'package:yessine/view/loading.dart';

import '../shared/globals.dart';

class CTFs extends StatefulWidget {
  const CTFs({super.key});

  @override
  State<CTFs> createState() => _CTFsState();
}

class _CTFsState extends State<CTFs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: oddDarkBgColor,
      alignment: Alignment.center,
      constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance.collection("ctfs").get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            final List<Map<String, dynamic>> data = snapshot.data!.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> e) => e.data()).toList();
            return data.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LottieBuilder.asset("assets/lotties/empty.json"),
                        Text("No CTFs yet.", style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  )
                : Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    runSpacing: 20,
                    spacing: 20,
                    children: <Widget>[
                      for (final Map<String, dynamic> item in data)
                        InkWell(
                          onTap: () => launchUrlString(item["url"]),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              AnimatedContainer(
                                width: 250,
                                height: 250,
                                duration: 300.ms,
                                padding: const EdgeInsets.all(48),
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: CachedNetworkImageProvider(item["image"]))),
                                child: Column(
                                  children: <Widget>[
                                    Text(item["name"], style: GoogleFonts.jura(fontSize: 20, color: whiteColor, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    Text(
                                      item["difficulty"] == null ? "EASY" : item["difficulty"].toUpperCase(),
                                      style: GoogleFonts.jura(
                                        fontSize: 20,
                                        color: item["difficulty"] == null || item["difficulty"].isEmpty || item["difficulty"].toUpperCase() == "EASY"
                                            ? Colors.green
                                            : item["difficulty"].toUpperCase() == "MEDIUM"
                                                ? Colors.orange
                                                : item["difficulty"].toUpperCase() == "HARD"
                                                    ? Colors.red
                                                    : Colors.purple.shade900,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(decoration: const BoxDecoration(boxShadow: <BoxShadow>[BoxShadow(color: Colors.black, blurStyle: BlurStyle.inner, spreadRadius: 40)])),
                            ],
                          ),
                        ),
                    ],
                  );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return const Loading();
          }
          return BlueScreenOfDeath(error: snapshot.error.toString());
        },
      ),
    );
  }
}
