import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yessine/shared/globals.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _linkState = false;
  late final List<Map<String, dynamic>> _icons;

  @override
  void initState() {
    _icons = <Map<String, dynamic>>[
      <String, dynamic>{
        "icon": FontAwesome.envelope_solid,
        "tooltip": "Send me an E-mail!",
        "callback": () {},
      },
      <String, dynamic>{
        "icon": FontAwesome.x_twitter_brand,
        "tooltip": "Follow me on X",
        "callback": () {},
      },
      <String, dynamic>{
        "icon": FontAwesome.github_brand,
        "tooltip": "Visit my Github !",
        "callback": () {},
      },
      <String, dynamic>{
        "icon": FontAwesome.linkedin_brand,
        "tooltip": "Let's connect on LinkedIn !",
        "callback": () {},
      },
      <String, dynamic>{
        "icon": Icons.view_timeline_sharp,
        "tooltip": "Download my CV here!",
        "callback": () {},
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 64),
      color: evenDarkBgColor,
      child: Column(
        children: <Widget>[
          Text("Yassine Sahli", style: GoogleFonts.jura(fontSize: 35, color: whiteColor, fontWeight: FontWeight.w500)),
          const SizedBox(height: 20),
          Text("IT Student Specialized In Network Security", style: GoogleFonts.jura(fontSize: 28, color: garkGreyColor, fontWeight: FontWeight.w500)),
          const SizedBox(height: 20),
          StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) _) {
              return InkWell(
                hoverColor: transparent,
                splashColor: transparent,
                highlightColor: transparent,
                onTap: () => true,
                onHover: (bool value) => _(() => _linkState = value),
                child: Text(
                  "Higher Institute of Technological Studies in Communications of Tunis",
                  style: GoogleFonts.jura(fontSize: 16, color: lightBlueColor, fontWeight: FontWeight.w500, decoration: !_linkState ? TextDecoration.none : TextDecoration.underline),
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
                    icon: Icon(icon["icon"], color: lightBlueColor, size: 25),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
