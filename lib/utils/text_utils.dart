part of 'utils.dart';

extension StringCasingExtension on String {
  String toCapitalize() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalize())
      .join(' ');
  String toCamelCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalize())
      .join('');

  String snakeCaseToWords() {
    List<String> parts = split('_');
    List<String> words = [];

    for (String part in parts) {
      words.add(part);
    }

    return words.join(' ');
  }

  String toJoinWords() {
    List<String> parts = split('_');
    List<String> words = [];

    for (String part in parts) {
      words.add(part);
    }

    return words.join('');
  }
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

String fixIcoWord(String word) {
  if (word.endsWith("iico")) {
    return word.replaceFirst(RegExp(r'iico$'), 'ico');
  } else {
    return word;
  }
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
