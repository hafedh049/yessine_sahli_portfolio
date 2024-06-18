import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:yessine/utils/callbacks.dart';

import 'holder.dart';
import 'view/blue_sod.dart';
import 'view/loading.dart';

void main() {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) => BlueScreenOfDeath(error: details.exception.toString());
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yassine Sahli",
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<FirebaseApp>(
        future: load(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
          if (snapshot.hasData) {
            return const Holder();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          return BlueScreenOfDeath(error: snapshot.error.toString());
        },
      ),
    );
  }
}
