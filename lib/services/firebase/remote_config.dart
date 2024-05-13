import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'dart:developer';

class FirebaseRemoteConfigKeys {
  static const String periodicTablePdf = 'periodic_table_pdf';
}

class FirebaseRemoteConfigService {
  /* ... */

  FirebaseRemoteConfigService._()
      : _remoteConfig = FirebaseRemoteConfig.instance; // MODIFIED

  static FirebaseRemoteConfigService? _instance; // NEW
  factory FirebaseRemoteConfigService() =>
      _instance ??= FirebaseRemoteConfigService._(); // NEW

  final FirebaseRemoteConfig _remoteConfig;

  String get periodicTablePdf =>
      _remoteConfig.getString(FirebaseRemoteConfigKeys.periodicTablePdf); // NEW

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(minutes: 5), // MODIFIED
        ),
      );

  Future<void> _setDefaults() async => _remoteConfig.setDefaults(
        const {
          FirebaseRemoteConfigKeys.periodicTablePdf:
              'Hey there, this message is coming from local defaults.',
        },
      );

  Future<void> fetchAndActivate() async {
    bool updated = await _remoteConfig.fetchAndActivate();

    if (updated) {
      print('The config has been updated.');
    } else {
      print('The config is not updated..');
    }
  }

  Future<void> initialize() async {
    await _setConfigSettings();
    await _setDefaults();
    await fetchAndActivate();
  }
}

/* // It will look like that when we call it outside.
final message = FirebaseRemoteConfigService().welcomeMessage; */
