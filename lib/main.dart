import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:yessine/shared/callbacks.dart';

import 'holder.dart';
import 'view/blue_sod.dart';

void main() {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: load(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
        if (snapshot.hasData) {
          return const GetMaterialApp(
            title: "Yassine Sahli",
            home: Holder(),
            debugShowCheckedModeBanner: false,
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        return BlueScreenOfDeath(error: snapshot.error.toString());
      },
    );
  }
}
