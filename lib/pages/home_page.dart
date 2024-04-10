part of 'pages.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        centerTitle: true,
      ),
      body: ScaffoldBackground(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                ButtonCategory(
                  icon: FontAwesomeIcons.flask,
                  text: 'Compuestos',
                  onPress: () {
                    context.push('/compounds_page');
                  },
                  color1: Color(0xff8D0074),
                  color2: Color(0xff8D0074),
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
                  color1: Color(0xff8061C0),
                  color2: Color(0xff8061C0),
                ),
              ],
            ),
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
