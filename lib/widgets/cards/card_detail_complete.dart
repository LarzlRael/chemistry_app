part of '../widgets.dart';

class CardDetailComplete extends StatelessWidget {
  const CardDetailComplete({
    super.key,
    this.getPeriodicElement,
  });
  final LocalPeriodicElement? getPeriodicElement;
  static const routeName = 'card_detail_complete';
  @override
  Widget build(BuildContext context) {
    return Card(
        child: DataTable(
      rows: [
        buildDataRow('Simbolo', getPeriodicElement?.symbol.toString()),
        buildDataRow(
            'Número atómico', getPeriodicElement?.atomicNumber.toString()),
        buildDataRow('Masa Atómica', getPeriodicElement?.atomicMass.toString()),
        buildDataRow('Configuración Electrónica',
            getPeriodicElement?.electronConfiguration),
        buildDataRow('Estado estandar', getPeriodicElement?.standardState.name),
        buildDataRow('Punto de ebullición', getPeriodicElement?.boilingPoint,
            valueProcessor: (value) => convertKelvinToCelsius(value),
            unit: '°C'),
        buildDataRow(
          'Punto de fusión',
          getPeriodicElement?.meltingPoint,
          valueProcessor: (value) => convertKelvinToCelsius(value),
          unit: '°C',
        ),
        buildDataRow('Densidad', getPeriodicElement?.density?.toString() ?? ''),
        buildDataRow('Electronegatividad',
            getPeriodicElement?.electronegativity.toString()),
        buildDataRow(
          'Estados de oxidación',
          getPeriodicElement?.oxidationStates.toString(),
          type: TypeTable.arrayText,
        ),
        buildDataRow(
            'Energía de ionización', getPeriodicElement?.ionizationEnergy,
            unit: 'eV'),
        buildDataRow(
            'Afinidad electronica', getPeriodicElement?.electronAffinity,
            unit: 'eV'),
        buildDataRow('Año de Descubrimiento',
            getPeriodicElement?.yearDiscovered.toString()),
      ],
      columns: [
        DataColumn(label: Text('Propiedad ')),
        DataColumn(label: Text('Valor'))
      ],
    ));
  }
}

enum TypeTable { text, arrayText }

DataRow buildDataRow(
  String label,
  dynamic value, {
  String unit = '',
  String Function(dynamic)? valueProcessor,
  TypeTable type = TypeTable.text,
}) {
  dynamic content = value;
  if (type == TypeTable.arrayText) {
    if (value == '' || value == null) {
      content = [];
    } else {
      content = (value as String)
          .split(',')
          .map((e) => int.parse(e.trim()))
          .sorted((a, b) => a.compareTo(b));
    }
  }
  if (valueProcessor != null) {
    content = valueProcessor(value);
  }
  return DataRow(cells: [
    /* titleTable(label), */
    DataCell(SimpleText(label, fontSize: 15, fontWeight: FontWeight.w500)),
    /* Content */
    DataCell(type == TypeTable.arrayText
        ? Wrap(
            /* crossAxisAlignment: CrossAxisAlignment.start, */
            children: (content as Iterable<int>)
                .map(
                  (e) => Container(
                    margin: EdgeInsets.all(2.5),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: SimpleText(
                        e.toString(),
                        /* color: Colors.black, */
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        : Text(content != null ? content.toString() + ' $unit' : '')),
  ]);
}
