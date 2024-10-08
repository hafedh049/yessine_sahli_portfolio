import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
//import 'package:yessine/shared/callbacks.dart';

import '../utils/globals.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _emailState = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 64),
      color: evenDarkBgColor,
      child: ListView(
        children: <Widget>[
          Center(child: Text("Contact", style: GoogleFonts.jura(fontSize: 35, color: whiteColor, fontWeight: FontWeight.w500))),
          const SizedBox(height: 25),
          Text(
            "If you require any further information, please feel free to reach out to me. If I can be of any help, please do not hesitate to contact me. Please let me know if you have further questions on this matter.",
            style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(color: darkGreyColor.withOpacity(.4), borderRadius: BorderRadius.circular(5), border: Border.all(color: blueColor, width: 2)),
            child: TextField(
              controller: _nameController,
              style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(color: darkGreyColor.withOpacity(.4), borderRadius: BorderRadius.circular(5), border: Border.all(color: blueColor, width: 2)),
            child: TextField(
              controller: _emailController,
              style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: "E-mail",
                hintStyle: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(color: darkGreyColor.withOpacity(.4), borderRadius: BorderRadius.circular(5), border: Border.all(color: blueColor, width: 2)),
            child: TextField(
              controller: _messageController,
              maxLines: 15,
              style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: "Message",
                hintStyle: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () async {
              if (_emailController.text.trim().isNotEmpty && _nameController.text.trim().isNotEmpty && _messageController.text.trim().isNotEmpty) {
                // sendMessage(_nameController.text.trim(), _emailController.text.trim(), _messageController.text.trim());
              }
            },
            highlightColor: transparent,
            hoverColor: transparent,
            splashColor: transparent,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(5), border: Border.all(color: whiteColor)),
                    child: Text("SEND", style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              const Icon(FontAwesome.envelope, size: 25, color: lightBlueColor),
              const SizedBox(width: 10),
              StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return InkWell(
                    hoverColor: transparent,
                    splashColor: transparent,
                    highlightColor: transparent,
                    onTap: () => true,
                    onHover: (bool value) => _(() => _emailState = value),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("yassine1sehli@gmail.com", style: GoogleFonts.jura(fontSize: 18, color: lightBlueColor, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 5),
                        AnimatedContainer(duration: 300.ms, color: lightBlueColor, width: _emailState ? "yassine1sehli@gmail.com".length * 10 : 0, height: 1),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              const Icon(FontAwesome.map_location_solid, size: 25, color: whiteColor),
              const SizedBox(width: 10),
              StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return InkWell(
                    hoverColor: transparent,
                    splashColor: transparent,
                    highlightColor: transparent,
                    onTap: () => true,
                    onHover: (bool value) => _(() => _emailState = value),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Ariana, Tunis", style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 5),
                        AnimatedContainer(duration: 300.ms, color: whiteColor, width: _emailState ? "Ariana, Tunis".length * 8.5 : 0, height: 1),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
