/* part of 'providers.dart';

class FirebaseRemoteConfigKeys {
  static const String periodicTablePdf = 'periodic_table_pdf';
}

final firebaseRemoteConfigServiceProvider =
    StateNotifierProvider((ref) => FirebaseRemoteConfigNotifier());

class FirebaseRemoteConfigNotifier
    extends StateNotifier<FirebaseRemoteConfigService> {
  FirebaseRemoteConfigNotifier() : super(FirebaseRemoteConfigService._());

  Future<void> initialize() async {
    state = await state.initialize();
  }
}

class FirebaseRemoteConfigService {
  FirebaseRemoteConfigService._()
      : _remoteConfig = FirebaseRemoteConfig.instance;

  final FirebaseRemoteConfig _remoteConfig;

  String get periodicTablePdf =>
      _remoteConfig.getString(FirebaseRemoteConfigKeys.periodicTablePdf);

  Future<FirebaseRemoteConfigService> initialize() async {
    await _setConfigSettings();
    await _setDefaults();
    await fetchAndActivate();
    return this;
  }

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(seconds: 1),
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
      print('The config is not updated.');
    }
  }
}
 */