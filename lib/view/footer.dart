import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
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
  late final List<Map<String, dynamic>> _icons;

  @override
  void initState() {
    _icons = <Map<String, dynamic>>[
      <String, dynamic>{
        "icon": FontAwesome.creative_commons_brand,
        "callback": () async => await launchUrlString(""),
      },
      <String, dynamic>{
        "icon": FontAwesome.circle_dollar_to_slot_solid,
        "callback": () async => await launchUrlString(""),
      },
      <String, dynamic>{
        "icon": FontAwesome.people_line_solid,
        "callback": () async => await launchUrlString(""),
      },
      <String, dynamic>{
        "icon": FontAwesome.equals_solid,
        "callback": () async => await launchUrlString(""),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: oddDarkBgColor,
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height * .15,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("all rights reserved © 2023", style: GoogleFonts.jura(fontSize: 16, color: darkGreyColor, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final Map<String, dynamic> icon in _icons)
                Tooltip(
                  message: icon["tooltip"],
                  child: IconButton(
                    onPressed: icon["callback"],
                    icon: Icon(icon["icon"], color: lightBlueColor, size: 25),
                  ),
                ),
            ],
          ),
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
                        fontSize: 16,
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
                    onTap: () async => await launchUrlString("https://github.com/HugoBlox/hugo-blox-builder"),
                    onHover: (bool value) => _(() => _openSourceState = value),
                    child: Text(
                      "open source ",
                      style: GoogleFonts.jura(
                        fontSize: 16,
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
