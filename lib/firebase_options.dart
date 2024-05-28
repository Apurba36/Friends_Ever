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
    apiKey: 'AIzaSyCR5JWMgaxDa99aa41bEpHFSX2-_O-FEyw',
    appId: '1:398613190976:android:46dd400541076ae2f242a5',
    messagingSenderId: '398613190976',
    projectId: 'friend-ever',
    storageBucket: 'friend-ever.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdKjRgk8yVDjJ8J3JL59HlPugTclHGXMU',
    appId: '1:398613190976:ios:8b09f44617c2521ff242a5',
    messagingSenderId: '398613190976',
    projectId: 'friend-ever',
    storageBucket: 'friend-ever.appspot.com',
    androidClientId: '398613190976-0rhn6s25s10phlghpdnnr7ki0nv29d35.apps.googleusercontent.com',
    iosClientId: '398613190976-c2pvsicagdr2nhnqcerqgv91rmmgkacn.apps.googleusercontent.com',
    iosBundleId: 'com.example.friendsEver',
  );
}
