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
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

String fixIcoWord(String word) {
  if (word.endsWith("iico")) {
    // Remover la repetición de "ir"
    return word.replaceRange(word.length - 4, word.length - 2, "");
  } else {
    return word;
  }
}
