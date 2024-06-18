import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../utils/globals.dart';
import '../utils/helpers/cardos.dart';

class CTFs extends StatefulWidget {
  const CTFs({super.key});

  @override
  State<CTFs> createState() => _CTFsState();
}

class _CTFsState extends State<CTFs> {
  final GlobalKey<State> _ctfsKey = GlobalKey<State>();

  List<QueryDocumentSnapshot<Map<String, dynamic>>> _ctfs = <QueryDocumentSnapshot<Map<String, dynamic>>>[];

  final ScrollController _scrollController = ScrollController();

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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
      color: oddDarkBgColor,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24),
      child: Scrollbar(
        thumbVisibility: false,
        trackVisibility: false,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
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
                builder: (BuildContext context, void Function(void Function() _) _) {
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
                          children: <Widget>[for (final Map<String, dynamic> item in data) Cardos(item: item)],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
