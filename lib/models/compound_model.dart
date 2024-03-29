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
        return 'Ácido Oxácido';
      case TypeCompound.acido_polihidratado:
        return 'Ácido Polihidratado';
      case TypeCompound.oxoacido:
        return 'Oxácido';
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
  final bool isSuperIndex;
  final bool isSimplified;

  ValenceCompound({
    required this.value,
    required this.suffix,
    this.isSuperIndex = false,
    this.isSimplified = false,
  });

  ValenceCompound copyWith({
    int? value,
    String? suffix,
    bool? isSuperIndex,
    bool? isSimplified,
  }) {
    return ValenceCompound(
      value: value ?? this.value,
      suffix: suffix ?? this.suffix,
      isSuperIndex: isSuperIndex ?? this.isSuperIndex,
      isSimplified: isSimplified ?? this.isSimplified,
    );
  }

  List<String> concatValenceCompound() {
    return suffix.isNotEmpty ? [suffix, value.toString()] : [value.toString()];
  }
}

final specialNamesCases = {
  'Au': 'aur',
  'Pb': 'plumb',
  'Cu': 'cupr',
  'Ni': 'niquel',
  'Fe': 'ferr',
  'Mn': 'mangan',
  'S': 'sulfur',
  'N': 'nitr',
  'As': 'arseni',
};

class Compound {
  final PeriodicTableElement periodicTableElement;
  final String name;
  final List<ValenceCompound> formula;
  final TypeCompound type;
  final bool isSpecialCase;
  final Compound? compound;

  Compound({
    required this.periodicTableElement,
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
      periodicTableElement: element ?? this.periodicTableElement,
      name: name ?? this.name,
      formula: formula ?? this.formula,
      type: type ?? this.type,
      compound: compound ?? this.compound,
    );
  }
}
