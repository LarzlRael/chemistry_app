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
  acido_hidracido,
  oxoacido,
  anhidrido,
  ion,
  sal_neutra,
  sal_doble,
  sal_basicas,
  sal_hidracida,
  hidruro_no_metalico,
}

extension TypeCompoundExtension on TypeCompound {
  String get name {
    final compoundNames = {
      TypeCompound.oxido: 'Óxido',
      TypeCompound.peroxido: 'Peroxido',
      TypeCompound.hidroxido: 'Hidróxido',
      TypeCompound.hidruro: 'Hidruro',
      TypeCompound.oxido_doble: 'Óxido doble',
      TypeCompound.acido_oxacido: 'Ácido oxácido',
      TypeCompound.acido_polihidratado: 'Ácido polihidratado',
      TypeCompound.oxoacido: 'Oxácido',
      TypeCompound.anhidrido: 'Anhídrido',
      TypeCompound.ion: 'Ion',
      TypeCompound.sal_neutra: 'Sal Neutra',
      TypeCompound.sal_doble: 'Sal Doble',
      TypeCompound.sal_basicas: 'Sal Básica',
      TypeCompound.acido_hidracido: 'Ácido Hidrácidos',
      TypeCompound.hidruro_no_metalico: 'Hidruro no metálico',
      TypeCompound.sal_hidracida: 'Sal Hidrácida',
    };

    return compoundNames[this] ?? '';
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
  final Color color;
  final Color colorValue;

  ValenceCompound({
    required this.value,
    required this.suffix,
    this.isSuperIndex = false,
    this.isSimplified = false,
    this.color = Colors.white,
    this.colorValue = Colors.white,
  });

  ValenceCompound copyWith({
    int? value,
    String? suffix,
    bool? isSuperIndex,
    bool? isSimplified,
    Color? color,
    Color? colorValue,
  }) {
    return ValenceCompound(
      value: value ?? this.value,
      suffix: suffix ?? this.suffix,
      isSuperIndex: isSuperIndex ?? this.isSuperIndex,
      isSimplified: isSimplified ?? this.isSimplified,
      color: color ?? this.color,
      colorValue: colorValue ?? this.colorValue,
    );
  }

  String concatValenceCompound() {
    return '$value$suffix';
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
  final String compoundString;

  Compound({
    required this.periodicTableElement,
    required this.name,
    required this.formula,
    required this.type,
    this.isSpecialCase = false,
    this.compound,
    this.compoundString = '',
  });

  Compound copyWith({
    PeriodicTableElement? element,
    String? name,
    List<ValenceCompound>? formula,
    TypeCompound? type,
    Compound? compound,
    String? formulaString,
  }) {
    return Compound(
      periodicTableElement: element ?? this.periodicTableElement,
      name: name ?? this.name,
      formula: formula ?? this.formula,
      type: type ?? this.type,
      compound: compound ?? this.compound,
      compoundString: formulaString ?? this.compoundString,
    );
  }
}
