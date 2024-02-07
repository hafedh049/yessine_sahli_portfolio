import 'package:flutter/material.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

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
– Web Applications Vulnerabilities ;
– Web Applications Exploitation ;
– Basic Pentesting ;
– Brute forcing ;
– Service enumeration ;
– Linux Enumeration ;
– OWASP TOP 10 ;
– Python Security Oriented ;
– Performing Training Sessions : Programming With Python ;
– Nmap Automated Scanner Tool Development From Scratch ;
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
      height: MediaQuery.sizeOf(context).height,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: StepperListView(
        showStepperInLast: true,
        stepperData: _stepperData,
        stepAvatar: (_, data) {
          final stepData = data as StepperItemData;
          return PreferredSize(
            preferredSize: const Size.fromRadius(20),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                stepData.avatar!,
              ),
            ),
          );
        },
        stepWidget: (_, data) {
          final stepData = data as StepperItemData;
          return PreferredSize(
            preferredSize: const Size.fromWidth(30),
            child: Text(
              stepData.content['born_date'] ?? '',
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
        stepContentWidget: (_, data) {
          final stepData = data as StepperItemData;
          return Container(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            padding: const EdgeInsets.all(
              15,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(7),
              visualDensity: const VisualDensity(
                vertical: -4,
                horizontal: -4,
              ),
              title: Text(stepData.content['name'] ?? ''),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 3,
                        child: Icon(Icons.work),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(stepData.content['occupation'] ?? ''),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 3,
                        child: Icon(Icons.phone),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(stepData.content['mobileNumber'] ?? ''),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 3,
                        child: Icon(Icons.email),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(stepData.content['email'] ?? ''),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Contact Link',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Linked-In',
                                style: theme.textTheme.caption,
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: GestureDetector(
                                onTap: () {
                                  _launchURL(stepData.content['contact_list']['LinkedIn']);
                                },
                                child: Text(
                                  stepData.content['contact_list']['LinkedIn'] ?? '',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Portfolio',
                                style: theme.textTheme.caption,
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: GestureDetector(
                                onTap: () {
                                  _launchURL(stepData.content['contact_list']['Portfolio']);
                                },
                                child: Text(
                                  stepData.content['contact_list']['Portfolio'] ?? '',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: theme.dividerColor,
                  width: 0.8,
                ),
              ),
            ),
          );
        },
        stepperThemeData: StepperThemeData(
          lineColor: theme.primaryColor,
          lineWidth: 5,
        ),
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
