part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quimica con el D.R. SIMI'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              /*  CardOption(
                title: 'Compuestos',
                /* subtitle: 'Aprende sobre los compuestos', */
                color: Colors.blue[300]!.withOpacity(0.20),
                onTap: () => context.push('/compounds_page'),
              ),
              CardOption(
                title: 'Juegos',
                /* subtitle: 'Juega y aprende', */
                color: Colors.green.withOpacity(0.20),
                onTap: () => context.push('/games_page'),
              ),
              CardOption(
                title: 'Elementos',
                /* subtitle: 'Aprende sobre los elementos', */
                color: Colors.red.withOpacity(0.20),
                onTap: () => context.push('/elements_page'),
              ), */
              ButtonCategory(
                icon: FontAwesomeIcons.flask,
                text: 'Compuestos',
                onPress: () {},
                color1: Colors.red,
                color2: Colors.redAccent,
              ),
              ButtonCategory(
                icon: FontAwesomeIcons.fantasyFlightGames,
                text: 'Juegos',
                onPress: () {
                  context.push('/games_page');
                },
                color1: Colors.blue,
                color2: Colors.blueAccent,
              ),
              ButtonCategory(
                icon: FontAwesomeIcons.atom,
                text: 'Elementos',
                onPress: () {
                  context.push('/elements_page');
                },
                color1: Colors.green,
                color2: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ),
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
                SimpleText(
                    text: title,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    padding: const EdgeInsets.only(bottom: 2),
                    color: Colors.black54),
                subtitle == null
                    ? const SizedBox()
                    : SimpleText(
                        text: subtitle!,
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
