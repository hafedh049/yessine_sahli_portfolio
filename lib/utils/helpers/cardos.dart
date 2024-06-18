import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../globals.dart';

class Cardos extends StatefulWidget {
  const Cardos({super.key, required this.item});
  final Map<String, dynamic> item;
  @override
  State<Cardos> createState() => _CardosState();
}

class _CardosState extends State<Cardos> {
  late final Timer _timer;

  int _currentIndex = 0;

  final GlobalKey<State<StatefulWidget>> _titleKey = GlobalKey<State<StatefulWidget>>();

  final Map<String, List<String>> _leetSpeaks = const <String, List<String>>{
    'A': <String>['4', '@', '/\\', 'α', 'Λ', 'Д', '^', '/-\\', '∂'],
    'E': <String>['3', '€', '£', 'ë', '[-', 'ê', 'ə', 'ε', 'ξ', 'є'],
    'I': <String>['1', '!', '|', '][', 'î', 'ï', '¡', 'l', 'ī'],
    'O': <String>['0', '()', '[]', '¤', 'oh', 'Ø', 'ö', 'Φ', '°', '⊗'],
    'U': <String>['v', 'μ', '(_)', '|_|', 'ù', 'ü', 'û', 'Ú', 'ū', 'µ'],
  };

  @override
  void initState() {
    _timer = Timer.periodic(2.seconds, (Timer timer) => _titleKey.currentState!.setState(() {}));
    super.initState();
  }

  String _transformer(String text) {
    final String target = _currentIndex.isEven
        ? text
        : text
            .split('')
            .map(
              (String e) => _leetSpeaks[e.toUpperCase()] == null
                  ? e
                  : _leetSpeaks[e.toUpperCase()]![Random().nextInt(
                      _leetSpeaks[e.toUpperCase()]!.length,
                    )],
            )
            .join();
    _currentIndex = (_currentIndex + 1) % 1000;
    return target;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrlString(widget.item["url"]),
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
              image: (widget.item["image"] == null || widget.item["image"].isEmpty || widget.item["image"] == '""' || widget.item["image"] == "''")
                  ? const DecorationImage(
                      image: AssetImage("assets/images/home_logo.png"),
                      fit: BoxFit.cover,
                    )
                  : DecorationImage(
                      image: NetworkImage(widget.item["image"]),
                      fit: BoxFit.cover,
                    ),
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
                      child: StatefulBuilder(
                        key: _titleKey,
                        builder: (BuildContext context, void Function(void Function()) _) {
                          return Animate(
                            key: ValueKey<int>(_currentIndex),
                            effects: const <Effect>[FadeEffect(), ShakeEffect()],
                            child: Text(
                              _transformer(widget.item["name"]),
                              style: GoogleFonts.jura(
                                fontSize: 18,
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: widget.item["difficulty"] == null || widget.item["difficulty"].isEmpty || widget.item["difficulty"].toUpperCase() == "EASY"
                      ? Colors.green.withOpacity(.3)
                      : widget.item["difficulty"].toUpperCase() == "MEDIUM"
                          ? Colors.orange.withOpacity(.3)
                          : widget.item["difficulty"].toUpperCase() == "HARD"
                              ? Colors.red.withOpacity(.3)
                              : Colors.purple.shade900.withOpacity(.3),
                  padding: const EdgeInsets.all(8),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Text(
                      widget.item["difficulty"] == null || widget.item["difficulty"].isEmpty || widget.item["difficulty"] == '""' || widget.item["difficulty"] == "''" ? "EASY" : widget.item["difficulty"].toUpperCase(),
                      style: GoogleFonts.jura(
                        fontSize: 16,
                        color: widget.item["difficulty"] == null || widget.item["difficulty"].isEmpty || widget.item["difficulty"].toUpperCase() == "EASY"
                            ? Colors.green
                            : widget.item["difficulty"].toUpperCase() == "MEDIUM"
                                ? Colors.orange
                                : widget.item["difficulty"].toUpperCase() == "HARD"
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
