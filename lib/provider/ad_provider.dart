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

final interstiatAdProvider =
    StateNotifierProvider<IntersitialAdNotifier, InterstialState>((ref) {
  return IntersitialAdNotifier();
});

class IntersitialAdNotifier extends StateNotifier<InterstialState> {
  IntersitialAdNotifier()
      : super(InterstialState(
            isAdLoaded: false, interstitialAd: null, counter: 0)) {
    loadAd();
  }

  void addCounterIntersitialAdAndShow() async {
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
        adUnitId: Enviroment.adIntersitialId,
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
                state = state.copyWith(isAdLoaded: false);
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
    print('showAd');
    if (state.interstitialAd != null && state.isAdLoaded) {
      state.interstitialAd!.show();
      /* loadAd(); */
    } else {
      loadAd();
      state.interstitialAd?.fullScreenContentCallback =
          FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          state.interstitialAd?.dispose();
          state = state.copyWith(interstitialAd: null);
        },
      );
    }
  }

  void disposeAd() {
    state.interstitialAd?.dispose();
    state = state.copyWith(interstitialAd: null, isAdLoaded: false);
  }
}

class InterstialState {
  final InterstitialAd? interstitialAd;
  final bool isAdLoaded;
  final int counter;
  InterstialState({
    required this.interstitialAd,
    required this.isAdLoaded,
    required this.counter,
  });

  factory InterstialState.initial() => InterstialState(
        interstitialAd: null,
        isAdLoaded: false,
        counter: 0,
      );
  InterstialState copyWith({
    InterstitialAd? interstitialAd,
    bool? isAdLoaded,
    int? counter,
  }) =>
      InterstialState(
        interstitialAd: interstitialAd ?? this.interstitialAd,
        isAdLoaded: isAdLoaded ?? this.isAdLoaded,
        counter: counter ?? this.counter,
      );
}
