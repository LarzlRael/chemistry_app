part of '../pages.dart';

class RoulleExample extends StatefulWidget {
  static const String routeName = 'roulle-example';
  const RoulleExample({Key? key}) : super(key: key);

  @override
  State<RoulleExample> createState() => _RoulleExampleState();
}

class _RoulleExampleState extends State<RoulleExample>
    with SingleTickerProviderStateMixin {
  static final _random = Random();

  late roulette2.RouletteController _controller;
  bool _clockwise = true;

  final colors = <Color>[
    Colors.red.withAlpha(50),
    Colors.green.withAlpha(30),
    Colors.blue.withAlpha(70),
    Colors.yellow.withAlpha(90),
    Colors.amber.withAlpha(50),
    Colors.indigo.withAlpha(70),
  ];

  final icons = <IconData>[
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_time,
    Icons.accessibility,
    Icons.account_balance,
    Icons.account_balance_wallet,
  ];

  /* final images = <ImageProvider>[
    // Use [AssetImage] if you have 2.0x, 3.0x images,
    // We only have 1 exact image here
    const ExactAssetImage("asset/gradient.jpg"),
    const NetworkImage("https://picsum.photos/seed/example1/400"),
    const ExactAssetImage("asset/gradient.jpg"),
    const NetworkImage("https://bad.link.to.image"),
    const ExactAssetImage("asset/gradient.jpg"),
    const NetworkImage("https://picsum.photos/seed/example5/400"),
    // MemoryImage(...)
    // FileImage(...)
    // ResizeImage(...)
  ]; */

  @override
  void initState() {
    super.initState();

    assert(colors.length == icons.length);
    /* assert(colors.length == images.length); */

    _controller = roulette2.RouletteController(
      vsync: this,
      group: roulette2.RouletteGroup.uniformIcons(
        colors.length,
        colorBuilder: (index) => colors[index],
        /* imageBuilder: (index) => images[index], */
        iconBuilder: (index) => icons[index],
        styleBuilder: (index) {
          return const TextStyle(color: Colors.black);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roulette'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Clockwise: ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: _clockwise,
                    onChanged: (onChanged) {
                      setState(() {
                        _controller.resetAnimation();
                        _clockwise = !_clockwise;
                      });
                    },
                  ),
                ],
              ),
              MyRoulette(
                controller: _controller,
                index: _random.nextInt(
                  colors.length,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.pink.withOpacity(0.1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Use the controller to run the animation with rollTo method
        onPressed: () async {
          await _controller.rollTo(
            _random.nextInt(colors.length),
            clockwise: _clockwise,
            offset: _random.nextDouble(),
          );
          print(
            _random.nextInt(colors.length),
          );
        },
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class MyRoulette extends StatelessWidget {
  const MyRoulette({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final roulette2.RouletteController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: 260,
          height: 260,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: roulette2.Roulette(
              // Provide controller to update its state
              controller: controller,

              // Configure roulette's appearance
              style: const roulette2.RouletteStyle(
                dividerThickness: 0.0,
                dividerColor: Colors.black,
                centerStickSizePercent: 0.05,
                centerStickerColor: Colors.black,
              ),
            ),
          ),
        ),
        const Icon(Icons.arrow_drop_down, size: 50),
        /* Text(
          controller.group.iconBuilder(index).codePoint.toString(),
          style: const TextStyle(fontSize: 20),
        ), */
      ],
    );
  }
}
