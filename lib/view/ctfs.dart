import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../shared/globals.dart';

class CTFs extends StatefulWidget {
  const CTFs({super.key});

  @override
  State<CTFs> createState() => _CTFsState();
}

class _CTFsState extends State<CTFs> {
  final GlobalKey<State> _ctfsKey = GlobalKey<State>();

  List<QueryDocumentSnapshot<Map<String, dynamic>>> _ctfs = <QueryDocumentSnapshot<Map<String, dynamic>>>[];

  Future<void> _load() async {
    await FirebaseFirestore.instance.collection("ctfs").get().then((QuerySnapshot<Map<String, dynamic>> value) => _ctfs = value.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> value) => value).toList());
    _ctfsKey.currentState!.setState(() {});
  }

  @override
  void initState() {
    _load();
    super.initState();
  }

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
          StatefulBuilder(
            key: _ctfsKey,
            builder: (BuildContext context, void Function(void Function() _) snapshot) {
              final List<Map<String, dynamic>> data = _ctfs.map((QueryDocumentSnapshot<Map<String, dynamic>> e) => e.data()).toList();
              return data.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          LottieBuilder.asset("assets/lotties/empty.json", width: 300, height: 300),
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
                                    image: (item["image"] == null || item["image"].isEmpty || item["image"] == '""' || item["image"] == "''") ? const DecorationImage(image: AssetImage("assets/images/home_logo.png"), fit: BoxFit.cover) : DecorationImage(image: NetworkImage(item["image"]), fit: BoxFit.cover),
                                  ),
                                ).animate(onComplete: (AnimationController controller) => controller.repeat(reverse: false)).shimmer(color: whiteColor.withOpacity(.1), duration: 3.5.seconds),
                                const SizedBox(height: 10),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Flexible(child: Text(item["name"], style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.bold))),
                                    const SizedBox(height: 10),
                                    Text(
                                      item["difficulty"] == null || item["difficulty"].isEmpty || item["difficulty"] == '""' || item["difficulty"] == "''" ? "EASY" : item["difficulty"].toUpperCase(),
                                      style: GoogleFonts.jura(
                                        fontSize: 16,
                                        color: item["difficulty"] == null || item["difficulty"].isEmpty || item["difficulty"].toUpperCase() == "EASY"
                                            ? Colors.green
                                            : item["difficulty"].toUpperCase() == "MEDIUM"
                                                ? Colors.orange
                                                : item["difficulty"].toUpperCase() == "HARD"
                                                    ? Colors.red
                                                    : Colors.purple.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}
