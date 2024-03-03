// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'models.dart';

enum TypeCompound {
  oxido,
  peroxido,
  hidroxido,
  hidruro,
  oxido_doble,
  acido_oxacido,
  acido_polihidratado,
  sal,
  hidracido,
  oxoacido,
  anhidrido,
  ion,
}

class Valence {
  final int value;
  final String suffix;
  Valence({
    required this.value,
    required this.suffix,
  });

  Valence copyWith({
    int? value,
    String? suffix,
  }) {
    return Valence(
      value: value ?? this.value,
      suffix: suffix ?? this.suffix,
    );
  }

  @override
  String toString() {
    return '$suffix$value';
  }
}

final specialOxidesNameCases = {
  'Au': 'aur',
  'Pb': 'plumb',
  'Cu': 'cupr',
  'Ni': 'niquel',
  'Fe': 'ferr',
  'Mn': 'mangan',
};
final specialHidrurosNameCases = {
  'Au': 'aur',
  'Mn': 'mangan',
  'N': 'nitr',
};

class Compound {
  final PeriodicTableElement element;
  final String name;
  final List<Valence> formula;
  final TypeCompound type;
  final Compound? compound;

  Compound({
    required this.element,
    required this.name,
    required this.formula,
    required this.type,
    this.compound,
  });

  Compound copyWith({
    PeriodicTableElement? element,
    String? name,
    List<Valence>? formula,
    TypeCompound? type,
    Compound? compound,
  }) {
    return Compound(
      element: element ?? this.element,
      name: name ?? this.name,
      formula: formula ?? this.formula,
      type: type ?? this.type,
      compound: compound ?? this.compound,
    );
  }
}
