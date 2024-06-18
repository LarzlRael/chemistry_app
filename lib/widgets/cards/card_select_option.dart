part of '../widgets.dart';

class CardSelectOption extends StatelessWidget {
  const CardSelectOption({
    super.key,
    this.onTap,
    required this.index,
    this.isSelectedAux,
    this.isSelected = false,
    required this.compound,
    required this.selectedCardIndex,
  });
  final Function()? onTap;
  final int index;
  final bool? isSelectedAux;
  final bool isSelected;
  final Compound compound;
  final int selectedCardIndex;
  @override
  Widget build(BuildContext context) {
    final colorSchema = Theme.of(context).colorScheme;
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selectedCardIndex == index
                ? selectedCardIndex == index && isSelectedAux != null
                    ? isSelectedAux!
                        ? Colors.green
                        : Colors.red
                    : colorSchema.primary
                : Colors.white,
          ),
          padding: EdgeInsets.all(2.5),
          width: 100,
          height: 60,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SimpleText(
                  compound.type.name,
                  fontSize: 15,
                  /* fontWeight: FontWeight.w500, */
                  textAlign: TextAlign.center,
                  color:
                      selectedCardIndex == index ? Colors.white : Colors.black,
                ),
              ),
              Positioned(
                right: 2.5,
                top: 2.5,
                child: Visibility(
                  visible: selectedCardIndex == index && isSelectedAux != null,
                  child: FadeIn(
                    duration: Duration(milliseconds: 250),
                    child: isSelectedAux != null
                        ? Icon(
                            isSelectedAux! ? Icons.check_circle : Icons.cancel,
                            size: 30,
                          )
                        : Container(child: Text("por defecto")),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
