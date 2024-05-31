part of '../pages.dart';

class ElementsDetail extends HookWidget {
  final PeriodicTableElement periodicTableElement;
  static const routeName = '/elements_detail_page';
  const ElementsDetail({
    super.key,
    required this.periodicTableElement,
  });
  @override
  Widget build(BuildContext context) {
    final getPeriodicElement = useFuture(
      useMemoized(() => getOneElementBySymbol(periodicTableElement.symbol)),
    );

    final size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: false,
          pinned: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            /* title: Text('Mi Título'), */
            /* collapseMode: CollapseMode.pin, */
            background: ElementCard(
              showGroup: false,
              size: size.width * 0.75,
              fontSize: 90,
              element: periodicTableElement,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: getPeriodicElement.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : getPeriodicElement.hasError
                  ? SizedBox()
                  : Card(
                      child: DataTable(
                      rows: [
                        buildDataRow('Simbolo',
                            getPeriodicElement.data?.symbol.toString()),
                        buildDataRow('Número atómico',
                            getPeriodicElement.data?.atomicNumber.toString()),
                        buildDataRow('Masa Atómica',
                            getPeriodicElement.data?.atomicMass.toString()),
                        buildDataRow('Configuración Electrónica',
                            getPeriodicElement.data?.electronConfiguration),
                        buildDataRow('Estado estandar',
                            getPeriodicElement.data?.standardState.name),
                        buildDataRow('Punto de ebullición',
                            getPeriodicElement.data?.boilingPoint,
                            valueProcessor: (value) =>
                                convertKelvinToCelsius(value)
                                    .toStringAsFixed(2),
                            unit: '°C'),
                        buildDataRow(
                          'Punto de fusión',
                          getPeriodicElement.data?.meltingPoint,
                          valueProcessor: (value) =>
                              convertKelvinToCelsius(value).toStringAsFixed(2),
                          unit: '°C',
                        ),
                        buildDataRow('Densidad',
                            getPeriodicElement.data?.density?.toString() ?? ''),
                        buildDataRow(
                            'Electronegatividad',
                            getPeriodicElement.data?.electronegativity
                                .toString()),
                        buildDataRow(
                          'Estados de oxidación',
                          getPeriodicElement.data?.oxidationStates.toString(),
                          type: TypeTable.arrayText,
                        ),
                        buildDataRow('Energía de ionización',
                            getPeriodicElement.data?.ionizationEnergy,
                            unit: 'eV'),
                        buildDataRow('Afinidad electronica',
                            getPeriodicElement.data?.electronAffinity,
                            unit: 'eV'),
                        buildDataRow('Año de Descubrimiento',
                            getPeriodicElement.data?.yearDiscovered.toString()),
                      ],
                      columns: [
                        DataColumn(label: Text('Propiedad ')),
                        DataColumn(label: Text('Valor'))
                      ],
                    )),
        ),
      ],
    );
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
    content = (value as String)
        .split(',')
        .map((e) => int.parse(e.trim()))
        .sorted((a, b) => b.compareTo(a));
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
