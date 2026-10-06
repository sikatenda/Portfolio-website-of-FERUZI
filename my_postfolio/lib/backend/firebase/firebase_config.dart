import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCD_Hy9iDjHQ3-YjdLMvEY8zZ3wjoeDTAc",
            authDomain: "my-postfolio-1n8i3a.firebaseapp.com",
            projectId: "my-postfolio-1n8i3a",
            storageBucket: "my-postfolio-1n8i3a.appspot.com",
            messagingSenderId: "767732044406",
            appId: "1:767732044406:web:84047b1c9489ccb0860557"));
  } else {
    await Firebase.initializeApp();
  }
}
