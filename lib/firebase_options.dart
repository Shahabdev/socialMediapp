// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqTI_xxctRZDczaV6NGH48v7gQEIGQoKQ',
    appId: '1:575727856255:android:7268a4afd304ffe2b7ed4a',
    messagingSenderId: '575727856255',
    projectId: 'social-media-app-84085',
    databaseURL: 'https://social-media-app-84085-default-rtdb.firebaseio.com',
    storageBucket: 'social-media-app-84085.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGC4l4XmSDSHKSecjoknr-g8NVLwQgaz0',
    appId: '1:575727856255:ios:fcfca495932fdeafb7ed4a',
    messagingSenderId: '575727856255',
    projectId: 'social-media-app-84085',
    databaseURL: 'https://social-media-app-84085-default-rtdb.firebaseio.com',
    storageBucket: 'social-media-app-84085.appspot.com',
    iosClientId: '575727856255-rgiugtk2gh3quvcnl4bl8rb4g0vst4e4.apps.googleusercontent.com',
    iosBundleId: 'com.example.socialMediaApp',
  );
}
