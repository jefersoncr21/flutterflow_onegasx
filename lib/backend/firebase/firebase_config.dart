import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAtj0vRr2DzWQN4pjxEkkJUn7V5swv6oBw",
            authDomain: "onegas-95f65.firebaseapp.com",
            projectId: "onegas-95f65",
            storageBucket: "onegas-95f65.appspot.com",
            messagingSenderId: "625112402974",
            appId: "1:625112402974:web:f50bceb65cd86908d8f20f"));
  } else {
    await Firebase.initializeApp();
  }
}
