part of 'pages.dart';

class HomePage extends HookWidget {
  static const routeName = '/';
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bodies = [
      /* context.push('/elements_page');
context.push('/compounds_page');
context.push('/games_page'); */
      ElementsPage(),
      CompoundsPage(),
      GamesPage(),
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
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                ghostLogo,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(width: 10),
            Text(appName),
          ],
        ),
        centerTitle: true,
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
