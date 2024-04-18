part of '../pages.dart';

class MenunItemGame {
  final String title;
  final String routeName;
  final IconData icon;
  MenunItemGame({
    required this.title,
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
      MenunItemGame(
        icon: Icons.abc,
        routeName: '$routeName/${GuessCompoundGame.routeName}',
        title: "Adivina el compuesto",
      ),
      MenunItemGame(
        icon: Icons.access_alarms,
        routeName: '$routeName/${GuessPeriodicElement.routeName}',
        title: "Adivina el compuesto",
      ),
      MenunItemGame(
        icon: Icons.access_alarm_outlined,
        routeName: '$routeName/${ElementsShake.routeName}',
        title: "Shake",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona un juego'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          final element = list[index];
          return InkWell(
            onTap: () => context.push(element.routeName),
            child: ListTile(
              leading: Icon(element.icon),
              title: Text(element.title),
            ),
          );
        },
      ),
    );
  }
}
