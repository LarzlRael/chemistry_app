part of 'utils.dart';

Future<List<LocalPeriodicElement>> loadPeriodicElementByJson() async {
  List<LocalPeriodicElement> listPeriodiTable = [];

  final data = await loadJsonFromAssets('assets/data/periodic_table.json');
  return localPeriodicElementFromJson(data);
}

Future<LocalPeriodicElement?> getOneElementBySymbol(String symbol) async {
  final data = await loadPeriodicElementByJson();
  return data.firstWhere((element) => element.symbol == symbol);
}
