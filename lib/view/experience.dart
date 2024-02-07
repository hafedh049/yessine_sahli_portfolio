import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
      "logo": "venari",
      "title": "Cybersecurity Intern",
      "first_subtitle": "Venari Security",
      "url": "https://www.venarisecurity.com",
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
      "logo": "resys",
      "title": "Cybersecurity Intern / Student Advanced Training Internship",
      "first_subtitle": "Resys-Consultants",
      "url": "http://www.resys-consultants.com",
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
      "logo": "little",
      "title": "Web Developer Intern / Student Initiation Internship",
      "first_subtitle": "Little Big Connections",
      "url": "https://www.littlebigconnection.com/en/",
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
      child: Column(
        children: <Widget>[
          Text("Experience", style: GoogleFonts.jura(fontSize: 35, color: whiteColor, fontWeight: FontWeight.w500)),
          const SizedBox(width: 25),
          _experiences.isEmpty
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
              : Column(
                  children: <Widget>[
                    for (final Map<String, dynamic> item in _experiences)
                      Container(
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
                                Image.asset("assets/images/${item["logo"]}.png", width: 80, height: 80),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(item["title"], style: GoogleFonts.jura(fontSize: 20, color: whiteColor, fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 5),
                                      InkWell(
                                        onTap: () async => await launchUrlString(item["url"]),
                                        child: Text(item["first_subtitle"], style: GoogleFonts.jura(fontSize: 16, color: blueColor, fontWeight: FontWeight.w500)),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(item["second_subtitle"], style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(item["description"], style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                  ],
                ),
        ],
      ),
    );
  }
}
