import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:templat_project/constants/enviroments.dart';
import 'package:templat_project/plugin/admob_plugin.dart';
import 'package:templat_project/services/services.dart';

const COUNTER_ADD = 'COUNTER_ADD';

final adBannerProvider = FutureProvider<BannerAd>((ref) async {
  /* Todo validar si se muestran o no las ads */
  final ad = await AdmobPlugin.loadBannerAd();
  return ad;
});

void addCounterIntersitialAd(Function callBack) async {
  const MAXCOUNT = 2;
  final keyValueStorageServiceImpl = KeyValueStorageServiceImpl();
  final getCurrentCounterAdd =
      await keyValueStorageServiceImpl.getValue<int>(COUNTER_ADD) ?? 0;

  await keyValueStorageServiceImpl.setKeyValue<int>(
      COUNTER_ADD, getCurrentCounterAdd + 1);

  if (getCurrentCounterAdd == MAXCOUNT) {
    callBack();
    await keyValueStorageServiceImpl.setKeyValue<int>(COUNTER_ADD, 0);
  }
}

final counterAdProvider = FutureProvider<int>((ref) async {
  final keyValueStorageServiceImpl = KeyValueStorageServiceImpl();
  final getCurrentCounterAdd =
      await keyValueStorageServiceImpl.getValue<int>(COUNTER_ADD);
  return getCurrentCounterAdd ?? 0;
});

final interstiatAdProvider =
    StateNotifierProvider<IntersitialAdNotifier, InterstialState>((ref) {
  return IntersitialAdNotifier();
});

class IntersitialAdNotifier extends StateNotifier<InterstialState> {
  IntersitialAdNotifier()
      : super(InterstialState(isAdLoaded: false, interstitialAd: null));

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
    if (state.interstitialAd != null && state.isAdLoaded) {
      state.interstitialAd!.show();
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
  InterstialState({
    required this.interstitialAd,
    required this.isAdLoaded,
  });

  InterstialState copyWith({
    InterstitialAd? interstitialAd,
    bool? isAdLoaded,
  }) =>
      InterstialState(
        interstitialAd: interstitialAd ?? this.interstitialAd,
        isAdLoaded: isAdLoaded ?? this.isAdLoaded,
      );
}
