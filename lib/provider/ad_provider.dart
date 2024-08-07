import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:templat_project/constants/enviroments.dart';
import 'package:templat_project/plugin/admob_plugin.dart';
import 'package:templat_project/services/services.dart';

const COUNTER_ADD = 'COUNTER_ADD';

final adBannerProvider = FutureProvider<BannerAd>((ref) async {
  final ad = await AdmobPlugin.loadBannerAd();
  return ad;
});

final interstitialAdProvider =
    StateNotifierProvider<InterstitialAdNotifier, InterstitialState>((ref) {
  return InterstitialAdNotifier();
});

class InterstitialAdNotifier extends StateNotifier<InterstitialState> {
  InterstitialAdNotifier()
      : super(InterstitialState(
            isAdLoaded: false, interstitialAd: null, counter: 0)) {
    loadAd();
  }

  void addCounterInterstitialAdAndShow() async {
    const MAXCOUNT = 2;
    final keyValueStorageServiceImpl = KeyValueStorageServiceImpl();
    final getCurrentCounterAdd =
        await keyValueStorageServiceImpl.getValue<int>(COUNTER_ADD) ?? 0;

    await keyValueStorageServiceImpl.setKeyValue<int>(
        COUNTER_ADD, getCurrentCounterAdd + 1);
    print('getCurrentCounterAdd: $getCurrentCounterAdd');
    print('MAXCOUNT: $MAXCOUNT');
    if (getCurrentCounterAdd == MAXCOUNT) {
      showAd();
      await keyValueStorageServiceImpl.setKeyValue<int>(COUNTER_ADD, 0);
    }
  }

  void loadAd() {
    if (!state.isAdLoaded) {
      InterstitialAd.load(
        adUnitId: Environment.adInterstitialId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (ad) {},
              onAdImpression: (ad) {},
              onAdFailedToShowFullScreenContent: (ad, err) {
                ad.dispose();
              },
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
                state = state.copyWith(isAdLoaded: false, interstitialAd: null);
                loadAd(); // Load a new ad
              },
              onAdClicked: (ad) {},
            );

            state = state.copyWith(interstitialAd: ad, isAdLoaded: true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            state = state.copyWith(isAdLoaded: false);
          },
        ),
      );
    }
  }

  void showAd() {
    if (state.interstitialAd != null && state.isAdLoaded) {
      state.interstitialAd!.show();
      return;
    }
    loadAd();
  }

  void disposeAd() {
    state.interstitialAd?.dispose();
    state = state.copyWith(interstitialAd: null, isAdLoaded: false);
  }
}

class InterstitialState {
  final InterstitialAd? interstitialAd;
  final bool isAdLoaded;
  final int counter;
  InterstitialState({
    required this.interstitialAd,
    required this.isAdLoaded,
    required this.counter,
  });

  factory InterstitialState.initial() => InterstitialState(
        interstitialAd: null,
        isAdLoaded: false,
        counter: 0,
      );
  InterstitialState copyWith({
    InterstitialAd? interstitialAd,
    bool? isAdLoaded,
    int? counter,
  }) =>
      InterstitialState(
        interstitialAd: interstitialAd ?? this.interstitialAd,
        isAdLoaded: isAdLoaded ?? this.isAdLoaded,
        counter: counter ?? this.counter,
      );
}
