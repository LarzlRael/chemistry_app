part of '../pages.dart';

class ElementsCompleteDetail extends HookWidget {
  const ElementsCompleteDetail({
    super.key,
    required this.symbol,
  });
  final String symbol;
  static const routeName = '/elements_complete_detail';
  @override
  Widget build(BuildContext context) {
    final getPeriodicElement = useFuture(
      useMemoized(() => getOneElementBySymbol(symbol)),
    );
    return getPeriodicElement.connectionState == ConnectionState.waiting
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: false,
                pinned: true,
                expandedHeight: 250,
                flexibleSpace: FlexibleSpaceBar(
                  /* title: Text('Mi Título'), */
                  /* collapseMode: CollapseMode.pin, */
                  background: CardPeriodicElementComplete(
                    padding: EdgeInsets.all(28),
                    size: 250,
                    atomicNumer:
                        getPeriodicElement.data?.atomicNumber.toString() ?? '',
                    atomicMass:
                        getPeriodicElement.data?.atomicMass.toString() ?? '',
                    symbol: getPeriodicElement.data?.symbol ?? '',
                    name: getPeriodicElement.data?.nombre ?? '',
                    chemicalGruop: getPeriodicElement.data?.bloque.name != null
                        ? getPeriodicElement.data!.bloque.name
                            .snakeCaseToWords()
                            .toCapitalize()
                        : '',
                    color: getPeriodicElement.data?.cpkHexColor.toString() == ""
                        ? '#03a9f4'
                        : getPeriodicElement.data?.cpkHexColor.toString(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CardDetailComplete(
                  getPeriodicElement: getPeriodicElement.data,
                ),
              ),
            ],
          );
  }
}
