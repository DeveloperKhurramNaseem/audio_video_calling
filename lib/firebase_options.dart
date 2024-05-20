// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCqrjUT5lBZabXd9fGLbTtm1hJzFg-QH3E',
    appId: '1:594092821246:web:ec79af35e687b0f34333af',
    messagingSenderId: '594092821246',
    projectId: 'audio-video-calling-31a3b',
    authDomain: 'audio-video-calling-31a3b.firebaseapp.com',
    storageBucket: 'audio-video-calling-31a3b.appspot.com',
    measurementId: 'G-83KEBM10NN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGhxaxjA-f1zb_Ark--IbRWpDZwsYrlpM',
    appId: '1:594092821246:android:f58bd092a48ea43d4333af',
    messagingSenderId: '594092821246',
    projectId: 'audio-video-calling-31a3b',
    storageBucket: 'audio-video-calling-31a3b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACGgc1BUpkh7Kyow1ae8ioq1Ukas03Ctk',
    appId: '1:594092821246:ios:7daf727fd1737d734333af',
    messagingSenderId: '594092821246',
    projectId: 'audio-video-calling-31a3b',
    storageBucket: 'audio-video-calling-31a3b.appspot.com',
    iosBundleId: 'com.example.audioVideoCalling',
  );
}
