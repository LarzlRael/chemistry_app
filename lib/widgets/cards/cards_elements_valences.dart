part of '../widgets.dart';

class ListTileElementsValences extends StatelessWidget {
  final List<PeriodicTableElement> elements;
  final Function(PeriodicTableElement element, Valencia valence)? onSelected;
  const ListTileElementsValences({
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
            child: ListTileElementValences(
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
          title: SimpleText(
            element.name,
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          subtitle: element.valencias.length == 1
              ? InkWell(
                  onTap: () => onTap?.call(element, element.valencias.first),
                  child: FilledButton(
                    /* style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ), */
                    child: Text(
                      "+" + element.valencias.first.value.toString(),
                      style: TextStyle(
                        /* color: Colors.white, */
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () =>
                        onTap?.call(element, element.valencias.first),
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
                                /* backgroundColor: Colors.blue, */
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text(
                                "+" + valence.value.toString(),
                                style: TextStyle(
                                  /* color: Colors.white, */
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () => onTap?.call(element, valence)),
                        );
                }).toList()),
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
    return IconButton(
      onPressed: onPressed,
      tooltip: !isShowWithOutSimplify
          ? "Mostrar formula sin simplificar"
          : "Mostrar formula simplificada",
      icon: Icon(
        color: Colors.white,
        size: 25,
        isShowWithOutSimplify
            ? Icons.remove_red_eye_outlined
            : Icons.remove_red_eye,
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
