import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show  kIsWeb;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyAR8WGklGG_S8nWZGi7S8v6yu8bl0Z57ng",
      authDomain: "guia-7985e.firebaseapp.com",
      projectId: "guia-7985e",
      storageBucket: "guia-7985e.appspot.com",
      messagingSenderId: "345724410380",
      appId: "1:345724410380:web:478795c0740d9c37c52c29",
      measurementId: "G-DR6F579QW8"
  );

}
