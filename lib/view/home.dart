import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/utils/globals.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _linkState = false;

  late final List<Map<String, dynamic>> _icons;

  final List<String> _interests = <String>[
    "CyberSecurity",
    "Information Security",
    "Programming & Coding",
    "Networking",
    "Internet of Things ( IOT )",
    "Cloud Computing",
    "Mobile Networks Security",
    "Systems & Services Security",
    "Incident Response",
  ];
  @override
  void initState() {
    _icons = <Map<String, dynamic>>[
      <String, dynamic>{
        "icon": FontAwesome.envelope_solid,
        "tooltip": "Send me an E-mail!",
        "callback": () async => await launchUrlString("mailto:yassine1sehli@gmail.com?subject=Request&body=->"),
      },
      <String, dynamic>{
        "icon": FontAwesome.github_brand,
        "tooltip": "Visit my Github !",
        "callback": () async => await launchUrlString("https://github.com/yassinSahli"),
      },
      <String, dynamic>{
        "icon": FontAwesome.linkedin_brand,
        "tooltip": "Let's connect on LinkedIn !",
        "callback": () async => await launchUrlString("https://www.linkedin.com/in/yassine-s/"),
      },
      <String, dynamic>{
        "icon": FontAwesome.square_youtube_brand,
        "tooltip": "Visit My YouTube Channel",
        "callback": () async => await launchUrlString("https://www.youtube.com/@sbid6759"),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 64),
      color: evenDarkBgColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 80),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AnimatedContainer(
                    duration: 500.ms,
                    width: 140,
                    height: 140,
                    decoration: const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/images/yassine.jpeg"), fit: BoxFit.cover)),
                  ),
                  const SizedBox(height: 20),
                  Text("Yassine Sahli", style: GoogleFonts.jura(fontSize: 30, color: whiteColor, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Text("Cybersecurity Engineering Student |  Top 10 in Tunisia on TryHackMe | eJPTv2® | RHCSA® | Ai-900 | CNSP | BTJA | HCIA IoT", style: GoogleFonts.jura(fontSize: 25, color: darkGreyColor, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return InkWell(
                        hoverColor: transparent,
                        splashColor: transparent,
                        highlightColor: transparent,
                        onTap: () async => await launchUrlString("https://tek-up.de/"),
                        onHover: (bool value) => _(() => _linkState = value),
                        child: Text(
                          "TEK-UP Private College of Engineering & Technology",
                          style: GoogleFonts.jura(fontSize: 18, color: lightBlueColor, fontWeight: FontWeight.w500, decoration: !_linkState ? TextDecoration.none : TextDecoration.underline, decorationColor: lightBlueColor, decorationThickness: 3),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      for (final Map<String, dynamic> icon in _icons)
                        Tooltip(
                          message: icon["tooltip"],
                          child: IconButton(
                            onPressed: icon["callback"],
                            icon: Icon(icon["icon"], color: lightBlueColor, size: 20),
                          ),
                        ),
                      StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance.collection("cvs").doc("X8aLQxW7L90jvOiYFm9f").snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                          return Tooltip(
                            message: "Download My CV",
                            child: IconButton(
                              onPressed: snapshot.hasData ? () async => await launchUrlString(snapshot.data!.get("cv")) : null,
                              icon: const Icon(Icons.view_timeline_sharp, color: lightBlueColor, size: 20),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "As a network security professional, I am passionate about making the digital world a safer place and protecting sensitive data from cyber threats. "
              "My academic journey has provided me with a solid understanding of networking principles, security protocols and effective strategies for mitigating potential risks. "
              "With hands-on experience in penetration testing and vulnerability identification, I am enthusiastic about collaborating with professionals and contribute to build stronger security systems. "
              "I am committed to constantly be up-to-date with the latest industry trends and best practices. If you want to learn more about my learning journey, feel free to check my personal website. ",
              style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Current Education :",
                    style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500, decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                    text: "Engineer’s degree in Security of Computer Systems and Networks",
                    style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Interests :",
                    style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500, decoration: TextDecoration.underline),
                  ),
                  for (final String interest in _interests)
                    TextSpan(
                      text: " $interest${_interests.last == interest ? "" : "  - "}",
                      style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
