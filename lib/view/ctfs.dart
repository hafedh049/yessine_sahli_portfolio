import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/view/loading.dart';

import '../shared/globals.dart';

class CTFs extends StatefulWidget {
  const CTFs({super.key});

  @override
  State<CTFs> createState() => _CTFsState();
}

class _CTFsState extends State<CTFs> {
  final TextEditingController _secretKeyController = TextEditingController();
  final _magicWord = "kaizen";
  @override
  void dispose() {
    _secretKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: oddDarkBgColor,
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("CTF", style: GoogleFonts.jura(fontSize: 35, color: whiteColor, fontWeight: FontWeight.w500)),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () async {
                    showModalBottomSheet(
                      backgroundColor: evenDarkBgColor,
                      context: context,
                      builder: (BuildContext context) => Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Enter the magic word.", style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 10),
                            TextField(
                              controller: _secretKeyController,
                              onSubmitted: (String value) async {
                                if (sha512.convert(utf8.encode(_magicWord)) == sha512.convert(utf8.encode(value))) {
                                  Fluttertoast.showToast(msg: "ACCESS GRANTED", webBgColor: "rgb(112,156,255)", fontSize: 18, webPosition: 'right', webShowClose: true, timeInSecForIosWeb: 2, textColor: whiteColor);
                                  final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                                  if (image != null) {
                                    Fluttertoast.showToast(msg: "IMAGE PICKED", webBgColor: "rgb(112,156,255)", fontSize: 18, webPosition: 'right', webShowClose: true, timeInSecForIosWeb: 2, textColor: whiteColor);
                                    if (true) {
                                      await FirebaseStorage.instance.ref().child("ctfs/images/").putFile(__image).then((TaskSnapshot task) => 0);
                                    }
                                    await FirebaseFirestore.instance.collection("ctfs").add(<String, dynamic>{});
                                  }
                                } else {
                                  Fluttertoast.showToast(msg: "WRONG CREDENTIALS", webBgColor: "rgb(255,0,0)", fontSize: 18, webPosition: 'right', webShowClose: true, timeInSecForIosWeb: 2, textColor: whiteColor);
                                }
                              },
                              style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                hintText: "Enter the secret passphrase",
                                hintStyle: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
                                prefixIcon: const Icon(FontAwesome.lock_solid, size: 15, color: blueColor),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: blueColor)),
                                contentPadding: const EdgeInsets.all(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    showModalBottomSheet(
                      backgroundColor: evenDarkBgColor,
                      context: context,
                      builder: (BuildContext context) => Container(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Spacer(),
                                Container(
                                  child: Text("ADD", style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(FontAwesome.plus_solid, size: 25, color: whiteColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
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
                      : SingleChildScrollView(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            runSpacing: 20,
                            spacing: 20,
                            children: <Widget>[
                              for (final Map<String, dynamic> item in data)
                                InkWell(
                                  onTap: () => launchUrlString(item["url"]),
                                  onLongPress: () {
                                    //delete
                                    showModalBottomSheet(
                                      backgroundColor: evenDarkBgColor,
                                      context: context,
                                      builder: (BuildContext context) => Container(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text("Enter the magic word.", style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500)),
                                            const SizedBox(height: 10),
                                            TextField(
                                              controller: _secretKeyController,
                                              onSubmitted: (String value) async {
                                                if (sha512.convert(utf8.encode(_magicWord)) == sha512.convert(utf8.encode(value))) {
                                                  Fluttertoast.showToast(msg: "ACCESS GRANTED", webBgColor: "rgb(112,156,255)", fontSize: 18, webPosition: 'right', webShowClose: true, timeInSecForIosWeb: 2, textColor: whiteColor);
                                                  await snapshot.data!.docs[data.indexOf(item)].reference.delete();
                                                  if (item["image"] != null || item["image"].isNotEmpty || item["image"] != '""' || item["image"] != "''") {
                                                    FirebaseStorage.instance.refFromURL(item["image"]).delete();
                                                  }
                                                  Fluttertoast.showToast(msg: "CTF DELETED SUCCESSFULLY", webBgColor: "rgb(0,255,0)", fontSize: 18, webPosition: 'right', webShowClose: true, timeInSecForIosWeb: 2, textColor: whiteColor);
                                                } else {
                                                  Fluttertoast.showToast(msg: "WRONG CREDENTIALS", webBgColor: "rgb(255,0,0)", fontSize: 18, webPosition: 'right', webShowClose: true, timeInSecForIosWeb: 2, textColor: whiteColor);
                                                }
                                              },
                                              style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
                                              decoration: InputDecoration(
                                                hintText: "Enter the secret passphrase",
                                                hintStyle: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
                                                prefixIcon: const Icon(FontAwesome.lock_solid, size: 15, color: blueColor),
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: blueColor)),
                                                contentPadding: const EdgeInsets.all(8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
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
                                          image: (item["image"] == null || item["image"].isEmpty || item["image"] == '""' || item["image"] == "''")
                                              ? const DecorationImage(
                                                  image: AssetImage("assets/images/home_logo.png"),
                                                  fit: BoxFit.cover,
                                                )
                                              : DecorationImage(
                                                  image: CachedNetworkImageProvider(item["image"]),
                                                  fit: BoxFit.cover,
                                                ),
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
                          ),
                        );
                }
                return const Loading();
              },
            ),
          ),
        ],
      ),
    );
  }
}
