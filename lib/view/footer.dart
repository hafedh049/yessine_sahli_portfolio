import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/shared/globals.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool _wowChemyState = false;
  bool _openSourceState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height * .2,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("all rights reserved © 2023", style: GoogleFonts.jura(fontSize: 16, color: darkGreyColor, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Published with ", style: GoogleFonts.jura(fontSize: 16, color: darkGreyColor, fontWeight: FontWeight.w500)),
              StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return InkWell(
                    hoverColor: transparent,
                    splashColor: transparent,
                    highlightColor: transparent,
                    onTap: () async => await launchUrlString("https://hugoblox.com/?utm_campaign=poweredby"),
                    onHover: (bool value) => _(() => _wowChemyState = value),
                    child: Text(
                      "Wowchemy ",
                      style: GoogleFonts.jura(
                        fontSize: 18,
                        color: lightBlueColor,
                        fontWeight: FontWeight.w500,
                        decoration: !_wowChemyState ? TextDecoration.none : TextDecoration.underline,
                        decorationColor: lightBlueColor,
                        decorationThickness: 3,
                      ),
                    ),
                  );
                },
              ),
              Text("— the free, ", style: GoogleFonts.jura(fontSize: 16, color: darkGreyColor, fontWeight: FontWeight.w500)),
              StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return InkWell(
                    hoverColor: transparent,
                    splashColor: transparent,
                    highlightColor: transparent,
                    onTap: () async => await launchUrlString("https://hugoblox.com/?utm_campaign=poweredby"),
                    onHover: (bool value) => _(() => _openSourceState = value),
                    child: Text(
                      "open source ",
                      style: GoogleFonts.jura(
                        fontSize: 18,
                        color: lightBlueColor,
                        fontWeight: FontWeight.w500,
                        decoration: !_openSourceState ? TextDecoration.none : TextDecoration.underline,
                        decorationColor: lightBlueColor,
                        decorationThickness: 3,
                      ),
                    ),
                  );
                },
              ),
              Text("website builder that empowers creators.", style: GoogleFonts.jura(fontSize: 16, color: darkGreyColor, fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}