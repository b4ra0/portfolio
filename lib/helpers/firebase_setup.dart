import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:portfolio_barao/firebase_options.dart';

class FirebaseConfig {
  late final FirebaseRemoteConfig remoteConfig;
  late final FirebaseApp firebaseApp;
  late final FirebaseFirestore firebaseFirestore;
  late final FirebaseStorage firebaseStorage;

  Future<void> setupFirebase() async {
    firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    remoteConfig = FirebaseRemoteConfig.instance;
    if (!Platform.isWindows && !Platform.isLinux) {
      await initializeFirebaseRemoteConfig();
    }

    firebaseFirestore = FirebaseFirestore.instance;
    firebaseStorage = FirebaseStorage.instance;
  }

  String getRemoteConfigString(String key) =>
      remoteConfig.getString(key);

  bool getRemoteConfigBool(String key) =>
      remoteConfig.getBool(key);

  int getRemoteConfigInt(String key) => remoteConfig.getInt(key);

  double getRemoteConfigDouble(String key) =>
      remoteConfig.getDouble(key);

  Future <void> initializeFirebaseRemoteConfig() async {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(minutes: 5),
      ),
    );
    await remoteConfig.setDefaults(const {
      'maintenance_mode': true,
    });
    await remoteConfig.setDefaults(const {});
    await remoteConfig.fetchAndActivate();
  }
}