part of '../pages.dart';

class CompoundsPage extends StatelessWidget {
  const CompoundsPage({super.key});
  static const routeName = '/compounds_page';

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
        appBar: AppBar(
          title: Text('Compuestos'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* SimpleText(
                     'Metales',
                    style: textTheme.titleMedium,
                  ),
                  SizedBox(height: 10), */
                Expanded(
                  child: AlignedGridView.count(
                    itemCount: compoundMetalList.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    itemBuilder: (context, index) {
                      final compoundOption = compoundMetalList[index];
                      return CompoundsOption(
                        compoundCard: compoundOption,
                        onTap: (option, type) {
                          switch (type) {
                            case TypeCompound.sal_neutra:
                              context
                                  .push('$routeName/${SalesNeutras.routeName}');
                              break;
                            case TypeCompound.sal_doble:
                              context
                                  .push('$routeName/${SalesDobles.routeName}');
                              break;
                            case TypeCompound.sal_basicas:
                              context
                                  .push('$routeName/${SalesBasicas.routeName}');
                              break;
                            case TypeCompound.sal_hidracida:
                              context.push(
                                  '$routeName/${SalesHidracidas.routeName}');
                              break;
                            default:
                              context
                                  .push('/compounds_by_type_page/${type.name}');
                              break;
                          }
                        },
                      );
                    },
                  ),
                ),

                /* SizedBox(
                      height:
                          20), // Espacio entre la rejilla de tarjetas y la siguiente lista
                  Expanded(
                    child: AlignedGridView.count(
                      itemCount: compoundNoMetalList.length,
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      itemBuilder: (context, index) {
                        final element = compoundNoMetalList[index];
                        return Hero(
                          tag: element.name,
                          child: CompoundsOption(
                            compoundCard: element,
                            onTap: (option) => context.push(
                              '/compounds_by_type_page/$option',
                            ),
                          ),
                        );
                      },
                    ),
                  ), */
              ],
            ),
          ),
        ));
  }
}

class CompoundsOption extends StatelessWidget {
  const CompoundsOption({
    super.key,
    required this.compoundCard,
    this.onTap,
  });
  final CompoundListElement compoundCard;
  final Function(String option, TypeCompound type)? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: () {
        if (onTap != null) {
          onTap!(compoundCard.name, compoundCard.type);
        }
      },
      child: Container(
        width: double.infinity,
        height: 125,
        margin: const EdgeInsets.all(2),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                compoundCard.pathImage,
                width: 50,
                height: 50,
              ),
              SimpleText(
                compoundCard.name,
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameOption extends StatelessWidget {
  const GameOption({
    super.key,
    required this.title,
    required this.assetImage,
    required this.routeName,
    this.onTap,
  });
  final String title;
  final String assetImage;
  final String routeName;
  final Function(String gameRoute)? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: () {
        if (onTap != null) {
          onTap!(routeName);
        }
      },
      child: Container(
        width: double.infinity,
        height: 125,
        margin: const EdgeInsets.all(2),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                assetImage,
                width: 50,
                height: 50,
              ),
              SimpleText(
                title,
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
