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
  sal_neutra,
}

extension TypeCompoundExtension on TypeCompound {
  String get name {
    switch (this) {
      case TypeCompound.oxido:
        return 'Óxido';
      case TypeCompound.peroxido:
        return 'Peroxido';
      case TypeCompound.hidroxido:
        return 'Hidróxido';
      case TypeCompound.hidruro:
        return 'Hidruro';
      case TypeCompound.oxido_doble:
        return 'Óxido Doble';
      case TypeCompound.acido_oxacido:
        return 'Ácido Oxoácido';
      case TypeCompound.acido_polihidratado:
        return 'Ácido Polihidratado';
      case TypeCompound.sal:
        return 'Sal';
      case TypeCompound.hidracido:
        return 'Hidrácido';
      case TypeCompound.oxoacido:
        return 'Oxoácido';
      case TypeCompound.anhidrido:
        return 'Anhídrido';
      case TypeCompound.ion:
        return 'Ion';
      case TypeCompound.sal_neutra:
        return 'Sal Neutra';
      default:
        return '';
    }
  }
}

TypeCompound getTypeCompoundFromString(String typeName) {
  for (TypeCompound compound in TypeCompound.values) {
    if (compound.name.toLowerCase() == typeName.toLowerCase()) {
      return compound;
    }
  }
  throw ArgumentError('Tipo de compuesto no válido: $typeName');
}

final anhidridoName = TypeCompound.anhidrido.name;

class ValenceCompound {
  final int value;
  final String suffix;
  ValenceCompound({
    required this.value,
    required this.suffix,
  });

  ValenceCompound copyWith({
    int? value,
    String? suffix,
  }) {
    return ValenceCompound(
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
final noMetalspecialNamesCases = {
  'S': 'sulfur',
  'Mn': 'mangan',
  'N': 'nitr',
};

class Compound {
  final PeriodicTableElement element;
  final String name;
  final List<ValenceCompound> formula;
  final TypeCompound type;
  final bool isSpecialCase;
  final Compound? compound;

  Compound({
    required this.element,
    required this.name,
    required this.formula,
    required this.type,
    this.isSpecialCase = false,
    this.compound,
  });

  Compound copyWith({
    PeriodicTableElement? element,
    String? name,
    List<ValenceCompound>? formula,
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
