part of '../widgets.dart';

class BannerAd extends ConsumerWidget {
  const BannerAd({super.key, this.margin});
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context, ref) {
    final adBanner = ref.watch(adBannerProvider);
    return adBanner.when(
      data: (bannerAd) => Container(
        margin: margin,
        width: bannerAd.size.width.toDouble(),
        height: bannerAd.size.height.toDouble(),
        child: AdWidget(ad: bannerAd),
      ),
      loading: () => Container(height: 50, child: SizedBox()),
      error: (error, stack) => SizedBox(),
    );
  }
}
