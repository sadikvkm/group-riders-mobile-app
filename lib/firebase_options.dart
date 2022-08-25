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
    apiKey: 'AIzaSyBTI3mOnhiqf0FCcWtDPgLZIFrDgfnLNaE',
    appId: '1:862641109086:android:15eda80683ebc2f6f21ccf',
    messagingSenderId: '862641109086',
    projectId: 'group-travel-9df4d',
    storageBucket: 'group-travel-9df4d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABhqygYKqI4E_gAnY6Uwbb6rtzyiR1vdY',
    appId: '1:862641109086:ios:f938b50868e4ef3df21ccf',
    messagingSenderId: '862641109086',
    projectId: 'group-travel-9df4d',
    storageBucket: 'group-travel-9df4d.appspot.com',
    androidClientId: '862641109086-gjpsp850llb7idbdds68mfan94g79c5a.apps.googleusercontent.com',
    iosClientId: '862641109086-5aft1j7lbiqms84lk7rtav1cmu9gvbm5.apps.googleusercontent.com',
    iosBundleId: 'com.group.travel.example.grouptravel',
  );
}