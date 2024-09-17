import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'globals.dart';

Future<FirebaseApp> load() async {
  try {
    return Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCMNDrUXUb_ImlWCUczhvVmXEIFzuQ7ct8",
        authDomain: "yassine-sahli.firebaseapp.com",
        projectId: "yassine-sahli",
        storageBucket: "yassine-sahli.appspot.com",
        messagingSenderId: "304135892478",
        appId: "1:304135892478:web:c787b0f0be35eda0caa4af",
        measurementId: "G-JXL6D39VCN",
      ),
    );
  } catch (e) {
    return Future.error(e);
  }
}

void showToast(String msg) => Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: 3,
      textColor: whiteColor,
      webShowClose: true,
      webBgColor: "rgb(112, 156, 255)",
    );
