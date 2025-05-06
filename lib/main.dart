import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:portfolio_barao/firebase_options.dart';
import 'package:portfolio_barao/helpers/firebase_setup.dart';
import 'package:portfolio_barao/screens/home.dart';
import 'package:portfolio_barao/screens/maintenance.dart';

Future<void> main() async {
  final firebaseConfig = FirebaseConfig();
  await firebaseConfig.setupFirebase();
  KiwiContainer()
      .registerInstance<FirebaseConfig>(firebaseConfig, name: 'firebaseConfig');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: KiwiContainer()
              .resolve<FirebaseConfig>('firebaseConfig')
              .getRemoteConfigBool('maintenance_mode')
          ? MaintenanceScreen()
          : const Home(),
    );
  }
}
