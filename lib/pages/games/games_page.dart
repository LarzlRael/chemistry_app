part of '../pages.dart';

class MenuItemGame {
  final String title;
  final String routeName;
  final IconData icon;
  final String assetImage;
  MenuItemGame({
    required this.title,
    required this.assetImage,
    required this.routeName,
    required this.icon,
  });
}

class GamesPage extends StatelessWidget {
  static const routeName = '/games_page';
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = [
      MenuItemGame(
        icon: Icons.access_alarms,
        routeName: '$routeName/${GuessPeriodicElement.routeName}',
        title: "Adivina el elemento de la tabla periodica",
        assetImage: "assets/chemestry/periodic_table_2.png",
      ),
      MenuItemGame(
        icon: Icons.abc,
        routeName: '$routeName/${GuessCompoundGame.routeName}',
        title: "Adivina el compuesto",
        assetImage: "assets/chemestry/game_compund.png",
      ),
      /* MenunItemGame(
        icon: Icons.access_alarm_outlined,
        routeName: '$routeName/${ElementsShake.routeName}',
        title: "Shake",
        assetImage: "assets/chemestry/periodic_table_2.png",
      ), */
      MenuItemGame(
        icon: Icons.access_alarm_outlined,
        routeName: '$routeName/${GuessTypeCompoundGame.routeName}',
        title: "Adivina el tipo de compuesto",
        assetImage: "assets/chemestry/acidos_hidracidos.png",
      ),
    ];
    return ScaffoldBackground(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Selecciona un juego"),
      ),
      body: AlignedGridView.count(
        itemCount: list.length,
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        itemBuilder: (BuildContext context, int index) {
          final element = list[index];
          return InkWell(
            onTap: () => context.push(element.routeName),
            child: GameOption(
              assetImage: element.assetImage,
              title: element.title,
              routeName: element.routeName,
              onTap: (route) => context.push(route),
            ),
          );
        },
      ),
    );
  }
}
