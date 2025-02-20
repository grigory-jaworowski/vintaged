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
    apiKey: 'AIzaSyBKDCxx24psOb5nTkZ-48ZUi5EyqSMRu6E',
    appId: '1:610225884236:web:de63306c19987483fe38e9',
    messagingSenderId: '610225884236',
    projectId: 'vintaged-71cb1',
    authDomain: 'vintaged-71cb1.firebaseapp.com',
    storageBucket: 'vintaged-71cb1.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHLRMNc4e1X7HQC2poVU_g_YnREzC62is',
    appId: '1:610225884236:android:464ad45c60410922fe38e9',
    messagingSenderId: '610225884236',
    projectId: 'vintaged-71cb1',
    storageBucket: 'vintaged-71cb1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBstTccK9DKWlYrPUBXpy6J6DdUYZx7vA',
    appId: '1:610225884236:ios:c4a8e3ab48a1a058fe38e9',
    messagingSenderId: '610225884236',
    projectId: 'vintaged-71cb1',
    storageBucket: 'vintaged-71cb1.firebasestorage.app',
    androidClientId: '610225884236-on6i0nsdlobmin1164fgck1bbsd16ehi.apps.googleusercontent.com',
    iosClientId: '610225884236-ovplr5oucvnfpb4ruabk2emr6e52mii9.apps.googleusercontent.com',
    iosBundleId: 'com.example.vintaged',
  );

}