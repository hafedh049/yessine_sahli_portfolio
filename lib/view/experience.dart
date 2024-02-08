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
      "logo": "Tawasol_Tech.png",
      "title": "Network Security Specialist Intern",
      "first_subtitle": "Tawasol Technology",
      "url": "https://www.tawasoltec.com/",
      "second_subtitle": "February 2023 – June 2023  Tunisia, Tunis",
      "description": """
During this professional experience, I had the opportunity to work on a project titled "Study, Design and Deployment of a Secure Network for a University Campus". The objective of this project was to enhance the reliability of a networking infrastructure while ensuring optimal security.

The project consisted of four critical parts:

1. Redesigning the Networking Architecture:
We began by conducting an comprehensive assessment of the existing network architecture of the existing network architecture to identify areas in need of improvement. This allowed us to redesign a more optimized network.

2. Establishing a Primary Security Layer:
Next, we applied basic security configurations to create an initial defense line for our network. This included implementing basic security policies, access control lists, and port security to prevent unauthorized access.

3. Assessment against Real-world Attack Scenarios:

During the assesment phase, we conducted various types of attacks on our networking infrastructure
 - Router Exploitation - SSH Bruteforcing
 - Router Configuration Tampering -Post-Exploit
 - Machine Exploitation EternalBlue MS17-010
 - WannaCry Ransomware Deployment -Post-Exploit
 - DoS & Distributed DoS Attacks
 - Man in The Middle Attacks - ARP Cache Poisoning

By simulating real-world attacks, we were able to identify potential vulnerabilities and weaknesses in the security architecture.

4. Deploying Advanced Mitigation Measures:
Based on the results of the attack phase, we applied several advanced security features to address the identified vulnerabilities. This included implementing NG-IPS, Setting up a FortiGate as a Firewall, and deploying a honey pot to lure attackers away from critical systems.

Overall, this project provided me with a comprehensive understanding of network security. It involved designing a large-sized network architecture, identifying potential vulnerabilities, and developing effective solutions to mitigate possible risks.

""",
    },
    <String, dynamic>{
      "logo": "venari.png",
      "title": "Cybersecurity Intern",
      "first_subtitle": "Venari Security",
      "url": "https://www.venarisecurity.com/",
      "second_subtitle": "October 2022 – December 2022  Tunisia, Lac II",
      "description": """
During this internship, I had the opportunity to conduct a comprehensive analysis of data collected from TLS handshake logs. This analysis allowed me to identify key trends and patterns that informed the development of a new client identification function.

We've conducted the enhancement of the client identification process based solely on the fields in the “Client Hello” message during a TLS handshake, by creating a custom function that works with Levenshtein algorithm distances and takes as input unique TLSv1.3 fields ;

1. Studying key differences between TLSv1.2 and TLSv1.3 to determine new available methods to identify a client without decryption.
2. Preparing a Pre-Processing unit that applies different filtering operations on several pcap files to output an ideal data set of TLS sessions in a CSV File.
3. Developing a JA3 Fingerprinting Calculator from scratch using Python in Jupyter.
4. Implementing the SSdeep and Levenshtein to identifty clients based on JA3 fields and comparing the results with Heatmaps.
5. Creating a Custom Function that will work with Levenshtein and take as input specefic TLSv1.3 fields that will identify clients in an even more reliable way.

Overall, this internship provided me with valuable experience in data analysis and software development. I am confident that the skills I gained will be useful in my future career endeavors.
""",
    },
    <String, dynamic>{
      "logo": "resys.png",
      "title": "Cybersecurity Intern ",
      "first_subtitle": "Resys-Consultants",
      "url": "http://www.resys-consultants.com/",
      "second_subtitle": "June 2022 – July 2022  Tunisia, Ariana",
      "description": """
During this internship, I had the opportunity to acquire a diverse range of skills and knowledge in various areas of the industry. My primary focus was on web application vulnerabilities and exploitation, as well as basic pentesting, brute forcing, service, and Linux enumeration.

In addition to these technical skills, I gained expertise in the OWASP TOP 10 standard awareness document by putting the framework into action. I used the SonarQube SAST engine to perform continuous inspection of code quality, which helped me to understand the importance of maintaining high-quality code.

Furthermore, I was able to refine my communication and training abilities by delivering a programming training session with python and reporting vulnerabilities and bugs. These experiences helped me to develop a keen eye for detail and a strong sense of responsibility.

I also developed a Python Automated Nmap Scanner Tool from scratch, which was a challenging yet rewarding experience. This project allowed me to apply my technical skills in a practical setting and gave me a sense of accomplishment.

Overall, my internship provided me with a solid foundation in the field of cybersecurity, and I am eager to continue developing my skills in this area. I am excited to bring my knowledge and experience to a dynamic and innovative organization in the industry, where I can contribute to the growth and success of the company.
""",
    },
    <String, dynamic>{
      "logo": "LittleBigConnections.jpg",
      "title": "IT Intern",
      "first_subtitle": "LittleBIG Connection",
      "url": "https://www.littlebigconnection.com/en/",
      "second_subtitle": "July 2021 – August 2021  Tunisia, Tunis",
      "description": """
During my initiation internship, I had the opportunity to develop my technical skills through my personal website development, while also gaining insight into the professional life in different departments of the host company.

The internship introduced me to the Agile Methodology and allowed me to apply theoretical knowledge in real-life tasks.
Through this experience, I developed a deeper understanding of the importance of collaboration and teamwork in achieving project goals, and I honed my ability to work efficiently in a fast-paced and dynamic environment.

Overall, the internship provided me with valuable practical experience and helped me to further develop my skills and competencies in the field of web development.

""",
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
                                Image.asset("assets/images/${item["logo"]}", width: 80, height: 80),
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
