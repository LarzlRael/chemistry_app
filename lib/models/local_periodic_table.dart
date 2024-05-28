part of 'models.dart';

// To parse this JSON data, do
//
//     final periodicElement = periodicElementFromJson(jsonString);

// To parse this JSON data, do
//
//     final localPeriodicElement = localPeriodicElementFromJson(jsonString);

List<LocalPeriodicElement> localPeriodicElementFromJson(String str) =>
    List<LocalPeriodicElement>.from(
        json.decode(str).map((x) => LocalPeriodicElement.fromJson(x)));

String localPeriodicElementToJson(List<LocalPeriodicElement> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocalPeriodicElement {
  final String nombre;
  final Estado estado;
  final Bloque bloque;
  final int atomicNumber;
  final String symbol;
  final String name;
  final double atomicMass;
  final dynamic cpkHexColor;
  final String electronConfiguration;
  final dynamic electronegativity;
  final dynamic atomicRadius;
  final dynamic ionizationEnergy;
  final dynamic electronAffinity;
  final dynamic oxidationStates;
  final StandardState standardState;
  final dynamic meltingPoint;
  final dynamic boilingPoint;
  final dynamic density;
  final GroupBlock groupBlock;
  final dynamic yearDiscovered;

  LocalPeriodicElement({
    required this.nombre,
    required this.estado,
    required this.bloque,
    required this.atomicNumber,
    required this.symbol,
    required this.name,
    required this.atomicMass,
    required this.cpkHexColor,
    required this.electronConfiguration,
    required this.electronegativity,
    required this.atomicRadius,
    required this.ionizationEnergy,
    required this.electronAffinity,
    required this.oxidationStates,
    required this.standardState,
    required this.meltingPoint,
    required this.boilingPoint,
    required this.density,
    required this.groupBlock,
    required this.yearDiscovered,
  });

  factory LocalPeriodicElement.fromJson(Map<String, dynamic> json) =>
      LocalPeriodicElement(
        nombre: json["Nombre"],
        estado: estadoValues.map[json["Estado"]]!,
        bloque: bloqueValues.map[json["Bloque"]]!,
        atomicNumber: json["AtomicNumber"],
        symbol: json["Symbol"],
        name: json["Name"],
        atomicMass: json["AtomicMass"]?.toDouble(),
        cpkHexColor: json["CPKHexColor"],
        electronConfiguration: json["ElectronConfiguration"],
        electronegativity: json["Electronegativity"],
        atomicRadius: json["AtomicRadius"],
        ionizationEnergy: json["IonizationEnergy"],
        electronAffinity: json["ElectronAffinity"],
        oxidationStates: json["OxidationStates"],
        standardState: standardStateValues.map[json["StandardState"]]!,
        meltingPoint: json["MeltingPoint"],
        boilingPoint: json["BoilingPoint"],
        density: json["Density"],
        groupBlock: groupBlockValues.map[json["GroupBlock"]]!,
        yearDiscovered: json["YearDiscovered"],
      );

  Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "Estado": estadoValues.reverse[estado],
        "Bloque": bloqueValues.reverse[bloque],
        "AtomicNumber": atomicNumber,
        "Symbol": symbol,
        "Name": name,
        "AtomicMass": atomicMass,
        "CPKHexColor": cpkHexColor,
        "ElectronConfiguration": electronConfiguration,
        "Electronegativity": electronegativity,
        "AtomicRadius": atomicRadius,
        "IonizationEnergy": ionizationEnergy,
        "ElectronAffinity": electronAffinity,
        "OxidationStates": oxidationStates,
        "StandardState": standardStateValues.reverse[standardState],
        "MeltingPoint": meltingPoint,
        "BoilingPoint": boilingPoint,
        "Density": density,
        "GroupBlock": groupBlockValues.reverse[groupBlock],
        "YearDiscovered": yearDiscovered,
      };
}

enum Bloque {
  ACTNIDO,
  GAS_NOBLE,
  HALGENO,
  LANTNIDO,
  METALOIDE,
  METAL_ALCALINO,
  METAL_ALCALINOTRREO,
  METAL_DE_POST_TRANSICIN,
  METAL_DE_TRANSICIN,
  NO_METAL
}

final bloqueValues = EnumValues({
  "Actínido": Bloque.ACTNIDO,
  "Gas noble": Bloque.GAS_NOBLE,
  "Halógeno": Bloque.HALGENO,
  "Lantánido": Bloque.LANTNIDO,
  "Metaloide": Bloque.METALOIDE,
  "Metal alcalino": Bloque.METAL_ALCALINO,
  "Metal alcalinotérreo": Bloque.METAL_ALCALINOTRREO,
  "Metal de post-transición": Bloque.METAL_DE_POST_TRANSICIN,
  "Metal de transición": Bloque.METAL_DE_TRANSICIN,
  "No metal": Bloque.NO_METAL
});

enum Estado { EMPTY, GAS, LQUIDO, SLIDO }

final estadoValues = EnumValues({
  "": Estado.EMPTY,
  "Gas": Estado.GAS,
  "Líquido": Estado.LQUIDO,
  "Sólido": Estado.SLIDO
});

enum GroupBlock {
  ACTINIDE,
  ALKALINE_EARTH_METAL,
  ALKALI_METAL,
  HALOGEN,
  LANTHANIDE,
  METALLOID,
  NOBLE_GAS,
  NONMETAL,
  POST_TRANSITION_METAL,
  TRANSITION_METAL
}

final groupBlockValues = EnumValues({
  "Actinide": GroupBlock.ACTINIDE,
  "Alkaline earth metal": GroupBlock.ALKALINE_EARTH_METAL,
  "Alkali metal": GroupBlock.ALKALI_METAL,
  "Halogen": GroupBlock.HALOGEN,
  "Lanthanide": GroupBlock.LANTHANIDE,
  "Metalloid": GroupBlock.METALLOID,
  "Noble gas": GroupBlock.NOBLE_GAS,
  "Nonmetal": GroupBlock.NONMETAL,
  "Post-transition metal": GroupBlock.POST_TRANSITION_METAL,
  "Transition metal": GroupBlock.TRANSITION_METAL
});

enum StandardState {
  EXPECTED_TO_BE_A_GAS,
  EXPECTED_TO_BE_A_SOLID,
  GAS,
  LIQUID,
  SOLID
}

extension StandardStateExtension on StandardState {
  String get name {
    switch (this) {
      case StandardState.EXPECTED_TO_BE_A_GAS:
        return 'Se espera que sea un gas';
      case StandardState.EXPECTED_TO_BE_A_SOLID:
        return 'Se espera que sea un sólido';
      case StandardState.GAS:
        return 'Gas';
      case StandardState.LIQUID:
        return 'Liquido';
      case StandardState.SOLID:
        return 'Solido';
    }
  }
}

final standardStateValues = EnumValues({
  "Expected to be a Gas": StandardState.EXPECTED_TO_BE_A_GAS,
  "Expected to be a Solid": StandardState.EXPECTED_TO_BE_A_SOLID,
  "Gas": StandardState.GAS,
  "Liquid": StandardState.LIQUID,
  "Solid": StandardState.SOLID
});

enum YearDiscoveredEnum { ANCIENT }

final yearDiscoveredEnumValues =
    EnumValues({"Ancient": YearDiscoveredEnum.ANCIENT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
