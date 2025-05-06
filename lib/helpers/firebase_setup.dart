import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:portfolio_barao/firebase_options.dart';

class FirebaseConfig {
  late final FirebaseRemoteConfig remoteConfig;
  late final FirebaseApp firebaseApp;

  Future<void> setupFirebase() async {
    firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    remoteConfig = FirebaseRemoteConfig.instanceFor(app: firebaseApp);
    await initializeFirebaseRemoteConfig();
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
      'maintenance_mode': false,
    });
    await remoteConfig.setDefaults(const {});
    await remoteConfig.fetchAndActivate();
  }
}