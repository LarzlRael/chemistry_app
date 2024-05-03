part of '../helpers.dart';

bool generateRandomBoolean() => Random().nextInt(2) == 0;

T getTRandomElement<T>(List<T> list) => list[Random().nextInt(list.length)];

T getTOneRandomElement<T>(List<T> originalList) {
  return originalList[Random().nextInt(originalList.length)];
}
