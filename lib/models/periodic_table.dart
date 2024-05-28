part of 'models.dart';

PeriodicElement periodicElementFromJson(String str) =>
    PeriodicElement.fromJson(json.decode(str));

String periodicElementToJson(PeriodicElement data) =>
    json.encode(data.toJson());

class PeriodicElement {
  final Table table;

  PeriodicElement({
    required this.table,
  });

  factory PeriodicElement.fromJson(Map<String, dynamic> json) =>
      PeriodicElement(
        table: Table.fromJson(json["Table"]),
      );

  Map<String, dynamic> toJson() => {
        "Table": table.toJson(),
      };

  List<ElementoQuimico> toElementList() {
    return table.row
        .map((row) => ElementoQuimico.fromRow(
              row.cell[0].toJson(),
            ))
        .toList();
  }
}

class Table {
  final PTColumns columns;
  final List<TPRow> row;

  Table({
    required this.columns,
    required this.row,
  });

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        columns: PTColumns.fromJson(json["Columns"]),
        row: List<TPRow>.from(json["Row"].map((x) => TPRow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Columns": columns.toJson(),
        "Row": List<dynamic>.from(row.map((x) => x.toJson())),
      };
}

class PTColumns {
  final List<String> column;

  PTColumns({
    required this.column,
  });

  factory PTColumns.fromJson(Map<String, dynamic> json) => PTColumns(
        column: List<String>.from(json["Column"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Column": List<dynamic>.from(column.map((x) => x)),
      };
}

class TPRow {
  final List<ElementoQuimico> cell;

  TPRow({
    required this.cell,
  });

  factory TPRow.fromJson(Map<String, dynamic> json) => TPRow(
        cell: List<ElementoQuimico>.from(
            json["Cell"].map((x) => ElementoQuimico.fromRow(x))),
      );

  Map<String, dynamic> toJson() => {
        "Cell": List<dynamic>.from(cell.map((x) => x.toJson())),
      };
}

class ElementoQuimico {
  final int atomicNumber;
  final String symbol;
  final String name;
  final double atomicMass;
  final String cpkHexColor;
  final String electronConfiguration;
  final double? electronegativity;
  final int atomicRadius;
  final double ionizationEnergy;
  final double? electronAffinity;
  final String oxidationStates;
  final String standardState;
  final double meltingPoint;
  final double boilingPoint;
  final double density;
  final String groupBlock;
  final int yearDiscovered;

  ElementoQuimico({
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

  factory ElementoQuimico.fromRow(Map<String, dynamic> json) {
    return ElementoQuimico(
      atomicNumber: int.parse(json['atomicNumber']),
      symbol: json['symbol'],
      name: json['name'],
      atomicMass: double.parse(json['atomicMass']),
      cpkHexColor: json['cpkHexColor'],
      electronConfiguration: json['electronConfiguration'],
      electronegativity: json['electronegativity'] != null
          ? double.parse(json['electronegativity'])
          : null,
      atomicRadius: int.parse(json['atomicRadius']),
      ionizationEnergy: double.parse(json['ionizationEnergy']),
      electronAffinity: json['electronAffinity'] != null
          ? double.parse(json['electronAffinity'])
          : null,
      oxidationStates: json['oxidationStates'],
      standardState: json['standardState'],
      meltingPoint: double.parse(json['meltingPoint']),
      boilingPoint: double.parse(json['boilingPoint']),
      density: double.parse(json['density']),
      groupBlock: json['groupBlock'],
      yearDiscovered: int.parse(json['yearDiscovered']),
    );
  }

  Map<String, dynamic> toJson() => {
        'atomicNumber': atomicNumber.toString(),
        'symbol': symbol,
        'name': name,
        'atomicMass': atomicMass.toString(),
        'cpkHexColor': cpkHexColor,
        'electronConfiguration': electronConfiguration,
        'electronegativity': electronegativity?.toString(),
        'atomicRadius': atomicRadius.toString(),
        'ionizationEnergy': ionizationEnergy.toString(),
        'electronAffinity': electronAffinity?.toString(),
        'oxidationStates': oxidationStates,
        'standardState': standardState,
        'meltingPoint': meltingPoint.toString(),
        'boilingPoint': boilingPoint.toString(),
        'density': density.toString(),
        'groupBlock': groupBlock,
        'yearDiscovered': yearDiscovered.toString(),
      };
}
