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
            /* title: Text('Mi Título'),
            collapseMode: CollapseMode.pin, */
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
                        DataRow(cells: [
                          DataCell(Text('Simbolo')),
                          DataCell(Text(
                              getPeriodicElement.data?.symbol.toString() ??
                                  '')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Número Atomico')),
                          DataCell(
                            Text(
                              getPeriodicElement.data?.atomicNumber
                                      .toString() ??
                                  '',
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Masa Atomica')),
                          DataCell(
                            Text(
                              getPeriodicElement.data?.atomicMass.toString() ??
                                  '',
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Configuración Electrónica')),
                          DataCell(Text(
                              getPeriodicElement.data?.electronConfiguration ??
                                  '')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Estado estandar')),
                          DataCell(Text(
                              getPeriodicElement.data?.standardState.name ??
                                  '')),
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text('Punto de ebullición'),
                          ),
                          DataCell(
                            Text(
                              getPeriodicElement.data?.boilingPoint != null
                                  ? converKelvinToCelsius(getPeriodicElement
                                              .data!.boilingPoint)
                                          .toStringAsFixed(2) +
                                      ' °C'
                                  : '',
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Densidad')),
                          DataCell(Text(
                              (getPeriodicElement.data?.density?.toString() ??
                                      '') +
                                  " g/cm³")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Electronegatividad')),
                          DataCell(Text(getPeriodicElement
                                  .data?.electronegativity
                                  .toString() ??
                              '')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Punto de funsión')),
                          DataCell(
                            Text(
                              getPeriodicElement.data?.meltingPoint != null
                                  ? converKelvinToCelsius(getPeriodicElement
                                              .data!.meltingPoint)
                                          .toStringAsFixed(2) +
                                      ' °C'
                                  : '',
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Estados de oxidación')),
                          DataCell(Text(getPeriodicElement.data?.oxidationStates
                                  .toString() ??
                              '')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Energía de ionización')),
                          DataCell(Text((getPeriodicElement
                                      .data?.ionizationEnergy
                                      .toString() ??
                                  '') +
                              ' eV')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Afinidad electronica')),
                          DataCell(Text((getPeriodicElement
                                      .data?.electronAffinity
                                      .toString() ??
                                  '') +
                              ' eV')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Año de Descubrimiento')),
                          DataCell(Text(getPeriodicElement.data?.yearDiscovered
                                  .toString() ??
                              '')),
                        ]),
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
