import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/shared/globals.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _linkState = false;
  late final List<Map<String, dynamic>> _icons;
  bool _pictureState = false;
  final List<String> _interests = <String>[
    "CyberSecurity",
    "Information Security",
    "Programming & Coding",
    "Networking",
    "Internet of Things",
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
        "callback": () async => controller.animateTo(MediaQuery.sizeOf(context).height * 2 + MediaQuery.sizeOf(context).height * .1, duration: 300.milliseconds, curve: Curves.linear),
      },
      <String, dynamic>{
        "icon": FontAwesome.x_twitter_brand,
        "tooltip": "Follow me on X",
        "callback": () async => await launchUrlString("https://twitter.com/Yassine___S"),
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
        "icon": Icons.view_timeline_sharp,
        "tooltip": "Download my CV here!",
        "callback": () async => await launchUrlString("http://www.google.com"),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 64),
      color: evenDarkBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return InkWell(
                      hoverColor: transparent,
                      splashColor: transparent,
                      highlightColor: transparent,
                      onTap: () => _(() => _pictureState = !_pictureState),
                      child: AnimatedContainer(
                        duration: 500.ms,
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/images/${_pictureState ? 'yassine.jpg' : 'home_logo.png'}"))),
                      ).animate(onComplete: (AnimationController controller) => controller.repeat(reverse: false)).shimmer(color: whiteColor.withOpacity(.1), duration: 3.5.seconds),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Text("Yassine Sahli", style: GoogleFonts.jura(fontSize: 30, color: whiteColor, fontWeight: FontWeight.w500)),
                const SizedBox(height: 20),
                Text("IT Student Specialized In Network Security", style: GoogleFonts.jura(fontSize: 25, color: darkGreyColor, fontWeight: FontWeight.w500)),
                const SizedBox(height: 20),
                StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return InkWell(
                      hoverColor: transparent,
                      splashColor: transparent,
                      highlightColor: transparent,
                      onTap: () async => await launchUrlString("https://www.isetcom.tn/public/home.faces"),
                      onHover: (bool value) => _(() => _linkState = value),
                      child: Text(
                        "Higher Institute of Technological Studies in Communications of Tunis",
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
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "I am currently working on several certifications to enhance my knowledge in different IT-related fields ; First thing worth mentionning, I am part of the AWS re/start cohort 7 program offered by both AWS and RBK Tunis (ReBootKamp) to train individuals and bring them closer to the Cloud Computing world, getting them ready for the “AWS Cloud Practionner” Certificate and offering them a FREE voucher. Along with that, I’ve been dedicating my time to write a fully detailed walkthrough for TryHackMe Jr Penetration Tester Pathway. In addition to those two, I’ve been studying for another certification ; “Microsoft Security, Compliance, and Identity Fundamentals” or for short “MS SC-900” and getting ready to sit for the exam as soon as possible. And finally, I’m also studying for the HCIA 5G certification. If you want to know more, my latest achievements are displayed in my linkedin account in the “Featured” Section ! Don’t hesitate to take a look !",
            style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500),
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
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Current Education :",
                  style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500, decoration: TextDecoration.underline),
                ),
                TextSpan(
                  text: " Bachelor Degree in IT, Network Security\nOct 2020 - Jul 2023",
                  style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
