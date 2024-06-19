part of 'pages.dart';

class HomePage extends HookWidget {
  static const routeName = '/';
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bodies = [
      ElementsPage(),
      CompoundsPage(),
      GamesPage(),
    ];
    final List<List<Widget>> actionsByPage = [
      [
        /* Switch(
          value: true,
          onChanged: (value) {},
        ), */
        IconButton(
          icon: Icon(FontAwesomeIcons.flask, size: 20),
          tooltip: 'Ir a tabla periódica completa',
          onPressed: () {
            context.push(PeriodicTablePage.routeName);
          },
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.download, size: 20),
          tooltip: 'Descargar tabla periódica',
          onPressed: () async {
            /* interstiatAdProviderN.addCounterIntersitialAdAndShow();
            await launchUrlFromString(remoteConfig.periodicTablePdf); */
          },
        ),
      ],
      [],
      []
    ];
    final indexBottomNavbar = useState(0);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: indexBottomNavbar.value,
        onDestinationSelected: (index) => indexBottomNavbar.value = index,
        destinations: [
          NavigationDestination(
              icon: Icon(Custom.ic_perodic_table), label: 'Tabla periódica'),
          NavigationDestination(
              icon: Icon(Custom.ic_compound), label: 'Compuesto'),
          NavigationDestination(icon: Icon(Custom.ic_trivia), label: 'Trivia'),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: actionsByPage[indexBottomNavbar.value],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                ghostLogo,
                width: 25,
                height: 25,
              ),
            ),
            const SizedBox(width: 10),
            SimpleText(
              appName,
              fontSize: 20,
            ),
          ],
        ),
        /* centerTitle: true, */
      ),
      body: bodies[indexBottomNavbar.value],
    );
  }
}

class CardOption extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color color;
  final Function() onTap;
  const CardOption({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 125,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          /* mainAxisAlignment: MainAxisAlignment.center, */
          children: [
            CircleAvatar(
              radius: 40,
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SimpleText(title,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    padding: const EdgeInsets.only(bottom: 2),
                    color: Colors.black54),
                subtitle == null
                    ? const SizedBox()
                    : SimpleText(
                        subtitle!,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
