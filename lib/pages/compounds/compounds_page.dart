part of '../pages.dart';

const compuntList = <String>["Oxidos", "Peróxidos", "Oxidos dobles"];

class CompoundsPage extends StatelessWidget {
  const CompoundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compuestos'),
      ),
      body: AlignedGridView.count(
        itemCount: compuntList.length,
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        itemBuilder: (context, index) {
          final element = compuntList[index];
          return CompoundsOption(
            title: element,
            /* key: ValueKey<String>(element.symbol),
            onTap: onSelected, */
            onTap: (option) => context.push(
              '/compounds_by_type_page/$option',
            ),
          );
        },
      ),
    );
  }
}

class CompoundsOption extends StatelessWidget {
  const CompoundsOption({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final Function(String option)? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!(title);
        }
      },
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
