part of '../pages.dart';

final elements = getTNRandomElement(compoundMetalList, 6);

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

  final icons = elements.map((e) => e.name).toList();

  final List<ImageProvider> images = compoundMetalList
      .take(6)
      .map((e) => ExactAssetImage(e.pathImage))
      .toList();
  final colors = compoundMetalList
      .take(6)
      .map((e) => colorByCompoundType(e.type))
      .toList();

  @override
  void initState() {
    super.initState();

    assert(colors.length == icons.length);
    /* assert(colors.length == images.length); */

    _controller = roulette2.RouletteController(
      vsync: this,
      group: roulette2.RouletteGroup.uniform(
        /* imageBuilder: (index) => images[index], */
        colors.length,
        colorBuilder: (index) => colors[index],
        /* imageBuilder: (index) => images[index], */
        textBuilder: (index) => icons[index].toString(),
        textStyleBuilder: (index) => TextStyle(
          color: Colors.grey[900],
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
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
          final randomValue = _random.nextInt(colors.length);
          await _controller.rollTo(
            randomValue,
            clockwise: _clockwise,
            offset: _random.nextDouble(),
          );
          print(randomValue);
          print(icons[randomValue]);
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
          width: 300,
          height: 300,
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
