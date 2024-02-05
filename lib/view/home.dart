import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yessine/shared/globals.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _linkState = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 64),
      color: homeBgColor,
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
