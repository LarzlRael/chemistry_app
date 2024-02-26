part of '../pages.dart';

class CompoundsPage extends StatelessWidget {
  const CompoundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compuestos'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: AlignedGridView.count(
          itemCount: compoundList.length,
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          itemBuilder: (context, index) {
            final element = compoundList[index];
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
    );
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
