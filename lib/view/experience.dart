import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepper_list_view/stepper_list_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../shared/globals.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final List<Map<String, dynamic>> _experiences = <Map<String, dynamic>>[
    <String, dynamic>{
      "logo": "",
      "title": "Cybersecurity Intern",
      "first_subtitle": "Venari Security",
      "second_subtitle": "October 2022 – December 2022  Tunisia, Lac II",
      "description": """
Enhancing the client identification process based solely on the fields in the “Client Hello” message during a TLS handshake, by creating a custom function that works with Levenshtein distances and takes as input unique TLSv1.3 fields ;
– Studying key differences between TLSv1.2 and TLSv1.3 to determine new available methods to identify a client without decryption ;
– Preparing a Pre-Processing unit that applies different filtering operations on several pcap files to output an ideal data set of TLS sessions in a CSV File ;
– Developing a JA3 Fingerprinting Calculator from scratch using Python in Jupyter ;
– Implementing the SSdeep and Levenshtein to identifty clients based on JA3 fields and comparing the results with Heatmaps ;
– Creating a Custom Function that will work with Levenshtein and take as input specefic TLSv1.3 fields that will identify clients in an even more reliable way.
""",
    },
    <String, dynamic>{
      "logo": "",
      "title": "Cybersecurity Intern / Student Advanced Training Internship",
      "first_subtitle": "Resys-Consultants",
      "second_subtitle": "June 2022 – July 2022  Tunisia, Ariana",
      "description": """
– Web Applications Vulnerabilities Analysis
– Web Applications Exploitation
– Basic Pentesting
– Brute forcing
– Service enumeration
– Linux Enumeration
– OWASP TOP 10
– Python Security Oriented
– Performing Training Sessions : Programming With Python
– Nmap Automated Scanner Tool Development From Scratch
– Reporting Vulnerabilities and Bugs.
""",
    },
    <String, dynamic>{
      "logo": "",
      "title": "Web Developer Intern / Student Initiation Internship",
      "first_subtitle": "Little Big Connections",
      "second_subtitle": "June 2021 – July 2021  Tunisia, Ariana",
      "description": "Web Development Fundamentals ; Personal Website Development",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: oddDarkBgColor,
      alignment: Alignment.center,
      constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: StepperListView(
        showStepperInLast: true,
        stepperData: _experiences.map((Map<String, dynamic> e) => StepperItemData(content: e)).toList(),
        stepAvatar: (BuildContext _, dynamic __) {
          return PreferredSize(
            preferredSize: const Size.fromRadius(20),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color: blueColor)),
              child: Container(decoration: const BoxDecoration(shape: BoxShape.circle, color: blueColor)),
            ),
          );
        },
        stepContentWidget: (BuildContext _, dynamic data) {
          final StepperItemData stepData = data as StepperItemData;
          return Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: darkGreyColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset("assets/images/${stepData.content["logo"]}", width: 80, height: 80),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Yassine Sahli", style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () async => await launchUrlString(""),
                          child: Text("Yassine Sahli", style: GoogleFonts.jura(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        stepperThemeData: const StepperThemeData(lineColor: blueColor, lineWidth: 5),
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
