import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDNJLq2RCcJG2DAIAfpboMgB8Y1o6keoAU",
            authDomain: "ai-assistant-build-ship-woo7y0.firebaseapp.com",
            projectId: "ai-assistant-build-ship-woo7y0",
            storageBucket: "ai-assistant-build-ship-woo7y0.appspot.com",
            messagingSenderId: "928233707205",
            appId: "1:928233707205:web:6e5f60d2e7474d662102ac"));
  } else {
    await Firebase.initializeApp();
  }
}
