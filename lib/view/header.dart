import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _titleState = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StatefulBuilder(

            builder: (BuildContext context , void Function(void Function())_) {
              return InkWell(
                onTap: ()=>true,
                onHover: (bool value) => _(() => _titleState = value),
                child: Text(
                  "Personal Website | Yassine Sahli",
                  style: GoogleFonts.jura(fontSize: 35,color: _titleState ? : ,fontWeight: FontWeight.w500),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
