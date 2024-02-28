// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'models.dart';

enum TypeCompound {
  oxido,
  peroxido,
  hidroxido,
  hidruro,
  oxido_doble,
  acido,
  sal,
  hidracido,
  oxoacido,
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
}

final specialOxidesNameCases = {
  'Au': 'aur',
  'Pb': 'plumb',
  'Cu': 'cupr',
  'Fe': 'ferr',
  'Mn': 'mangan',
};
final specialHidrurosNameCases = {
  'Au': 'aur',
  'Mn': 'mangan',
};

class Compound {
  final PeriodicTableElement element;
  final String name;
  final List<Valence> formula;
  final TypeCompound type;
  Compound({
    required this.element,
    required this.name,
    required this.formula,
    required this.type,
  });
}
