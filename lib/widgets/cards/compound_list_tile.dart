part of '../widgets.dart';

class CompundListTile extends StatelessWidget {
  final List<Compound> compounds;
  final Function(Compound element)? onSelected;
  const CompundListTile({
    super.key,
    this.onSelected,
    required this.compounds,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: ListView.builder(
        itemCount: compounds.length,
        itemBuilder: (context, index) {
          final element = compounds[index];
          return Hero(
            tag: element.name,
            child: ListTileCompound(
              element: element,
              key: ValueKey<String>(element.name),
              onTap: onSelected,
            ),
          );
        },
      ),
    );
  }
}

class ListTileCompound extends StatelessWidget {
  const ListTileCompound({
    super.key,
    required this.element,
    this.onTap,
  });

  final Compound element;
  final Function(Compound element)? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!(element);
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorByCompoundType(element.type),
                colorByCompoundType(element.type).withOpacity(0.5),
              ],
            ),
          ),
          child: ListTile(
            key: key,
            title: SimpleText(
              element.name,
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            /*  subtitle: Row(
              children: element.valencias
                  .map((e) => SimpleText(
                        text: e.value.toString(),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        color: Colors.white,
                      ))
                  .toList(),
            ), */
            leading: Card(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: FormulaInText(
                  compoundFormula: element.formula,
                  typeCompound: element.type,
                  textStyle: TextStyle(
                    /* color: Colors.black, */
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
