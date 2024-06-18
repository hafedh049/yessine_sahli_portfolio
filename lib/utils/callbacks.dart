import 'package:firebase_core/firebase_core.dart';

Future<FirebaseApp> load() async {
  try {
    return Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB_9akJd_XmnHfw8quX7Sg9M8pgpZIxjJA",
        authDomain: "yassine-sahli-8fbd9.firebaseapp.com",
        projectId: "yassine-sahli-8fbd9",
        storageBucket: "yassine-sahli-8fbd9.appspot.com",
        messagingSenderId: "770677621396",
        appId: "1:770677621396:web:8dc8081862af2bbcd5ea81",
      ),
    );
  } on Exception catch (e) {
    return Future.error(e);
  }
}
