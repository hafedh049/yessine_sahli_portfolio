import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/globals.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Contact", style: GoogleFonts.jura(fontSize: 64, color: whiteColor, fontWeight: FontWeight.w500)),
          const SizedBox(width: 40),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 25),
                Text(
                  "If you require any further information, please feel free to reach out to me. If I can be of any help, please do not hesitate to contact me. Please let me know if you have further questions on this matter.",
                  style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(color: darkGreyColor.withOpacity(.4), borderRadius: BorderRadius.circular(5), border: Border.all(color: blueColor, width: 2)),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w500),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
