part of '../helpers.dart';

class GuessPeriodicHelper {
  final List<PeriodicTableElement> listSuffle;
  final PeriodicTableElement correctAnswer;
  GuessPeriodicHelper({
    required this.listSuffle,
    required this.correctAnswer,
  });
}

class GuessCompoundHelper {
  final List<GuessCompoundHelper> listSuffle;
  final PeriodicTableElement correctAnswer;
  GuessCompoundHelper({
    required this.listSuffle,
    required this.correctAnswer,
  });
}

GuessPeriodicHelper generatePeriodicElementOptions(
  List<PeriodicTableElement> options,
  int amountOptions,
) {
  final randomOptions = List<PeriodicTableElement>.from(options)..shuffle();
  final correctOption = randomOptions.take(amountOptions).toList();

  return GuessPeriodicHelper(
    correctAnswer: correctOption[Random().nextInt(amountOptions)],
    listSuffle: correctOption,
  );
}
