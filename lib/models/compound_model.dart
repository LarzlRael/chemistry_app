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
  sal_hidracida
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
        return 'Óxido doble';
      case TypeCompound.acido_oxacido:
        return 'Ácido oxácido';
      case TypeCompound.acido_polihidratado:
        return 'Ácido polihidratado';
      case TypeCompound.oxoacido:
        return 'Oxácido';
      case TypeCompound.anhidrido:
        return 'Anhídrido';
      case TypeCompound.ion:
        return 'Ion';
      case TypeCompound.sal_neutra:
        return 'Sal Neutra';
      case TypeCompound.sal_doble:
        return 'Sal Doble';
      case TypeCompound.sal_basicas:
        return 'Sal Básica';
      case TypeCompound.acido_hidracido:
        return 'Ácido Hidrácidos';

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
