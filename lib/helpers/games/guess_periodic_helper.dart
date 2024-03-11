part of '../helpers.dart';

class GuessPeriodicHelper {
  final List<PeriodicTableElement> listSuffle;
  final PeriodicTableElement correctAnswer;
  GuessPeriodicHelper({
    required this.listSuffle,
    required this.correctAnswer,
  });
}

GuessPeriodicHelper generateOptions(
  List<PeriodicTableElement> options,
  int amountOptions,
) {
  final randomOptions = List<PeriodicTableElement>.from(options)..shuffle();
  final correctOption = randomOptions.take(amountOptions).toList();

  return GuessPeriodicHelper(
    listSuffle: correctOption,
    correctAnswer: correctOption[Random().nextInt(amountOptions)],
  );
}
