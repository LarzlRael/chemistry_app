import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static initEnviroment() async {
    await dotenv.load(
      fileName: '.env',
    );
  }

  static String adIntersitialId = dotenv.env['AD_INTERSITIAL_ID'] ??
      "ca-app-pub-3940256099942544/1033173712";
  static String adBannerId = dotenv.env['AD_INTERSITIAL_ID'] ??
      "ca-app-pub-3940256099942544/1033173712";
}
