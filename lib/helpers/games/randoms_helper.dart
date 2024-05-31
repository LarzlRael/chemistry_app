part of '../helpers.dart';

bool generateRandomBoolean() => Random().nextBool();

T getTRandomElement<T>(List<T> list) => list[Random().nextInt(list.length)];

T getTOneRandomElement<T>(List<T> originalList) =>
    originalList[Random().nextInt(originalList.length)];

List<T> getTNRandomElement<T>(List<T> originalList, int amount) {
  assert(amount <= originalList.length,
      'Amount of random elements must be less than or equal to the length of the original list.');

  // Crear una copia de la lista original y mezclarla
  List<T> shuffledList = List<T>.from(originalList)..shuffle();

  // Tomar los primeros `amount` elementos de la lista mezclada y retornarlos
  return shuffledList.take(amount).toList();
}
