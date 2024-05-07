part of '../helpers.dart';

bool generateRandomBoolean() => Random().nextInt(2) == 0;

T getTRandomElement<T>(List<T> list) => list[Random().nextInt(list.length)];

T getTOneRandomElement<T>(List<T> originalList) =>
    originalList[Random().nextInt(originalList.length)];

List<T> getTNRandomElement<T>(List<T> originalList, int amount) =>
    List<T>.from(originalList)
      ..shuffle()
      ..take(amount).toList();
