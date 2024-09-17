import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:yessine/models/models.dart';
import 'package:yessine/view/loading.dart';

import '../utils/globals.dart';
import '../utils/helpers/cardos.dart';
import 'blue_sod.dart';

class CTFs extends StatefulWidget {
  const CTFs({super.key});

  @override
  State<CTFs> createState() => _CTFsState();
}

class _CTFsState extends State<CTFs> {
  List<CTFModel> _ctfs = <CTFModel>[];

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
                Text("CTF", style: GoogleFonts.jura(fontSize: 35, color: whiteColor, fontWeight: FontWeight.w500)),
                const SizedBox(width: 20),
                /*HAKJKJ*/
              ],
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection("ctfs").orderBy("endPeriod", descending: true).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  _ctfs = snapshot.data!.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> e) => CTFModel.fromJson(e.data())).toList();
                  return _ctfs.isEmpty
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
                      : ListView(
                          children: <Widget>[
                            Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runAlignment: WrapAlignment.center,
                              runSpacing: 20,
                              spacing: 20,
                              children: <Widget>[for (final CTFModel ctf in _ctfs) Cardos(item: ctf)],
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
