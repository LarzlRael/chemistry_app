part of '../widgets.dart';

final pageBuckeCompunds = PageStorageBucket();

class CompundListTile extends StatelessWidget {
  final List<Compound> compounds;
  final Function(Compound element)? onSelected;
  final bool isSelected;
  const CompundListTile({
    super.key,
    this.onSelected,
    this.isSelected = false,
    required this.compounds,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: PageStorage(
        bucket: pageBuckeCompunds,
        child: ListView.builder(
          key: PageStorageKey<String>('pageCompund'),
          itemCount: compounds.length,
          itemBuilder: (context, index) {
            final element = compounds[index];
            return Hero(
              tag: element.name,
              child: ListTileCompound(
                isSelected: isSelected,
                element: element,
                key: ValueKey<String>(element.name),
                onTap: onSelected,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListTileCompound extends StatelessWidget {
  const ListTileCompound({
    super.key,
    this.onTap,
    required this.element,
    this.isSelected = false,
  });

  final bool isSelected;
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
            border: isSelected
                ? Border.all(
                    color: Colors.green,
                    width: 1,
                  )
                : null,
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
            leading: Card(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: FormulaInText(
                  compoundFormula: element.formula,
                  typeCompound: element.type,
                  textStyle: TextStyle(
                    /* color: Colors.black, */
                    fontSize: 18,
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
