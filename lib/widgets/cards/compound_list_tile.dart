part of '../widgets.dart';

class CompundListTile extends HookWidget {
  final List<Compound> compounds;
  final Function(Compound element)? onSelected;
  final bool isSelected;
  final String inputLabel;
  final bool showSearch;
  const CompundListTile({
    super.key,
    this.onSelected,
    this.isSelected = false,
    this.showSearch = true,
    this.inputLabel = 'Buscar compuesto',
    required this.compounds,
  });
  @override
  Widget build(BuildContext context) {
    final searchedCompound = useState<List<Compound>>(compounds);
    final textController = useTextEditingController();
    useEffect(() {
      textController.addListener(() {
        final text = textController.text.toLowerCase();
        if (text.isEmpty) {
          searchedCompound.value = compounds;
          return;
        }
        searchedCompound.value = compounds
            .where((element) => element.name.toLowerCase().contains(text))
            .toList();
      });
    }, []);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Column(
        children: [
          if (showSearch)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  labelText: inputLabel,
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  suffixIcon: textController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            textController.clear();
                            searchedCompound.value = compounds;
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: searchedCompound.value.length,
              itemBuilder: (context, index) {
                final element = searchedCompound.value[index];
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
        ],
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
