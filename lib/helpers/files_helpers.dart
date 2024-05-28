part of 'helpers.dart';

Future<String> loadJsonFromAssets(String filePath) async {
  String jsonString = await rootBundle.loadString(filePath);
  return jsonString;
}
