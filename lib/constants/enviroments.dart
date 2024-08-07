import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(
      fileName: '.env',
    );
  }

  static String adInterstitialId = dotenv.env['AD_INTERSITIAL_ID'] ??
      "ca-app-pub-3940256099942544/1033173712";
  static String adBannerId =
      dotenv.env['AD_BANNER_ID'] ?? "ca-app-pub-3940256099942544/1033173712";

  static String serverToken = dotenv.env['SERVER_TOKEN'] ?? "";
}
