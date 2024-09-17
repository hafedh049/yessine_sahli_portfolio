import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yessine/models/models.dart';

import '../globals.dart';

class Cardos extends StatefulWidget {
  const Cardos({super.key, required this.item});
  final CTFModel item;
  @override
  State<Cardos> createState() => _CardosState();
}

class _CardosState extends State<Cardos> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrlString(widget.item.url),
      child: Column(
        children: <Widget>[
          Container(
            width: 250,
            height: 250,
            padding: const EdgeInsets.all(24),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              border: Border.all(color: blueColor),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: CachedNetworkImageProvider(widget.item.images.first), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: lightBlueColor.withOpacity(.3),
                    padding: const EdgeInsets.all(8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Text(widget.item.name, style: GoogleFonts.jura(fontSize: 18, color: whiteColor, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: widget.item.difficulty.toUpperCase() == "EASY"
                      ? Colors.green.withOpacity(.3)
                      : widget.item.difficulty.toUpperCase() == "MEDIUM"
                          ? Colors.orange.withOpacity(.3)
                          : widget.item.difficulty.toUpperCase() == "HARD"
                              ? Colors.red.withOpacity(.3)
                              : Colors.purple.shade900.withOpacity(.3),
                  padding: const EdgeInsets.all(8),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Text(
                      widget.item.difficulty.toUpperCase(),
                      style: GoogleFonts.jura(
                        fontSize: 16,
                        color: widget.item.difficulty.toUpperCase() == "EASY"
                            ? Colors.green
                            : widget.item.difficulty.toUpperCase() == "MEDIUM"
                                ? Colors.orange
                                : widget.item.difficulty.toUpperCase() == "HARD"
                                    ? Colors.red
                                    : Colors.purple.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
