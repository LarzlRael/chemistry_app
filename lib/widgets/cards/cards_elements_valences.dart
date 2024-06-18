part of '../widgets.dart';

class ListTileElementsValences extends HookWidget {
  final List<PeriodicTableElement> elements;
  final Function(PeriodicTableElement element, Valencia valence)? onSelected;
  const ListTileElementsValences({
    super.key,
    this.onSelected,
    required this.elements,
  });
  @override
  Widget build(BuildContext context) {
    final colorSchema = Theme.of(context).colorScheme;
    final searchedPeriodicTable =
        useState<List<PeriodicTableElement>>(elements);
    final textController = useTextEditingController();
    useEffect(() {
      textController.addListener(() {
        final text = textController.text.toLowerCase();
        if (text.isEmpty) {
          searchedPeriodicTable.value = elements;
          return;
        }
        searchedPeriodicTable.value = elements
            .where((element) =>
                element.name.toLowerCase().contains(text) ||
                element.symbol.toLowerCase().contains(text))
            .toList();
      });
      /* return textController.dispose; */
    }, []);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: textController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: colorSchema.primary,
                  ),
                ),
                labelText: 'Buscar metal',
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
                          searchedPeriodicTable.value = elements;
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
              itemCount: searchedPeriodicTable.value.length,
              itemBuilder: (context, index) {
                final element = searchedPeriodicTable.value[index];
                return Hero(
                  tag: element.symbol,
                  child: ListTileElementValences(
                    element: element,
                    key: ValueKey<String>(element.symbol),
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

class ListTileElementsNegativesValences extends StatelessWidget {
  final List<PeriodicTableElement> elements;
  final Function(PeriodicTableElement element, Valencia valence)? onSelected;
  const ListTileElementsNegativesValences({
    super.key,
    this.onSelected,
    required this.elements,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: ListView.builder(
        itemCount: elements.length,
        itemBuilder: (context, index) {
          final element = elements[index];

          return Hero(
            tag: element.symbol,
            child: ListTileElementNegativeValue(
              element: element,
              key: ValueKey<String>(element.symbol),
              onTap: onSelected,
            ),
          );
        },
      ),
    );
  }
}

class ListTileElementValences extends StatelessWidget {
  const ListTileElementValences({
    super.key,
    required this.element,
    this.onTap,
  });

  final PeriodicTableElement element;
  final Function(PeriodicTableElement element, Valencia valence)? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorByGroup(element.group),
              colorByGroup(element.group).withOpacity(0.5),
            ],
          ),
        ),
        child: ListTile(
          key: key,
          title: Row(
            children: [
              SimpleText(
                element.name,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          subtitle: element.valencias.length == 1
              ? InkWell(
                  onTap: () => onTap?.call(element, element.valencias.first),
                  child: SimpleText(
                    element.valencias.first.value.toString(),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : Wrap(
                  children: element.valencias.map((valence) {
                  return valence.typeElement != TypeElement.metal
                      ? SizedBox()
                      : Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2.5),
                          child: FilledButton(
                              style: TextButton.styleFrom(
                                backgroundColor: secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SimpleText(
                                    valence.value.toString(),
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SimpleText(
                                    valence.suffix.name
                                        .toCamelCase()
                                        .toCapitalize(),
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ],
                              ),
                              onPressed: () => onTap?.call(element, valence)),
                        );
                }).toList()),
          leading: CircleAvatar(
            child: SimpleText(
              element.symbol,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

class ListTileElementNegativeValue extends StatelessWidget {
  const ListTileElementNegativeValue({
    super.key,
    required this.element,
    this.onTap,
  });

  final PeriodicTableElement element;
  final Function(PeriodicTableElement element, Valencia valence)? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorByGroup(element.group),
              colorByGroup(element.group).withOpacity(0.5),
            ],
          ),
        ),
        child: ListTile(
          key: key,
          title: SimpleText(
            element.name + " (" + element.symbol + ")",
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          subtitle: InkWell(
            onTap: () => onTap?.call(element, element.valencias.first),
            child: FilledButton(
              child: Text(
                getNegative(element.valencias.first.value).toString(),
                style: TextStyle(
                  /* color: Colors.white, */
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () => onTap?.call(element, element.valencias.first),
            ),
          ),
          leading: CircleAvatar(child: Text(element.symbol)),
        ),
      ),
    );
  }
}

class CardsElementsValences extends StatelessWidget {
  const CardsElementsValences({
    super.key,
    required this.onPressed,
    required this.isShowWithOutSimplify,
  });
  final Function() onPressed;
  final bool isShowWithOutSimplify;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      /* tooltip: !isShowWithOutSimplify
          ? "Mostrar formula sin simplificar"
          : "Mostrar formula simplificada", */
      child: Icon(
        color: Colors.white,
        size: 30,
        isShowWithOutSimplify
            ? FontAwesomeIcons.eye
            : FontAwesomeIcons.eyeSlash,
      ),
    );
  }
}

class ShowMessageSimply extends StatelessWidget {
  const ShowMessageSimply({
    super.key,
    required this.isShowWithOutSimplify,
    required this.isSimplify,
  });
  final bool isShowWithOutSimplify;
  final bool isSimplify;
  @override
  Widget build(BuildContext context) {
    return isShowWithOutSimplify
        ? SimpleText(
            padding: EdgeInsets.only(top: 10),
            !isSimplify ? "Formula simplificada" : "Formula sin simplificar",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          )
        : SizedBox();
  }
}
