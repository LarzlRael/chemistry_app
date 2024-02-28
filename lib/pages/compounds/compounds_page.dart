part of '../pages.dart';

class CompoundsPage extends StatelessWidget {
  const CompoundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: Text('Compuestos'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
              text: 'Metales',
              style: textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            Expanded(
              child: AlignedGridView.count(
                itemCount: compoundMetalList.length,
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                itemBuilder: (context, index) {
                  final element = compoundMetalList[index];
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
  final Function(String option)? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!(compoundCard.name);
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
                  text: compoundCard.name,
                  padding: const EdgeInsets.only(top: 5),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    /* color: Colors.white, */
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
