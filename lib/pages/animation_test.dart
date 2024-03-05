// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pages.dart';

class GlobalKeySwap {
  final GlobalKey key;
  final double x;
  final double y;
  GlobalKeySwap({
    required this.key,
    required this.x,
    required this.y,
  });

  GlobalKeySwap copyWith({
    GlobalKey? key,
    double? x,
    double? y,
  }) {
    return GlobalKeySwap(
      key: key ?? this.key,
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }
}

class AnimationTest extends HookWidget {
  const AnimationTest({super.key});
  static const routeName = 'animation_test';
  @override
  Widget build(BuildContext context) {
    final _containerKey = useState<GlobalKeySwap>(GlobalKeySwap(
      key: GlobalKey(),
      x: 0,
      y: 0,
    ));
    final _containerKey2 = useState<GlobalKeySwap>(GlobalKeySwap(
      key: GlobalKey(),
      x: 0,
      y: 0,
    ));
    ;
    final swapped = useState<bool>(false);
    void getScreenPosition(ValueNotifier<GlobalKeySwap> containerKey) {
      if (containerKey.value.key.currentContext != null) {
        RenderBox box = containerKey.value.key.currentContext!
            .findRenderObject() as RenderBox;
        Offset position =
            box.localToGlobal(Offset.zero); //this is global position
        containerKey.value = containerKey.value.copyWith(
          x: position.dx,
          y: position.dy,
        );
      }
    }

    useEffect(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        getScreenPosition(_containerKey);
        getScreenPosition(_containerKey2);
      });
    }, [_containerKey.value]);

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: swapped.value ? 0 : _containerKey2.value.x,
              child: Container(
                width: 50,
                height: 50,
                key: _containerKey.value.key,
                color: Colors.green,
                child: Text(
                  "1",
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: swapped.value ? 200 : _containerKey.value.x,
              child: Container(
                width: 50,
                height: 50,
                key: _containerKey2.value.key,
                color: Colors.cyan,
                child: Text(
                  "2",
                ),
              ),
            ),
            /* Positioned(
              top: 20,
              left: swapped.value ? 100 : x.value,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('AnimationTest'),
              ),
            ),
            Positioned(
              top: 20,
              left: swapped.value ? 0 : 100,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Text('AnimationTest'),
              ),
            ),
            Positioned(
              top: 20,
              right: 100,
              child: TextButton(
                onPressed: () {
                  swapped.value = !swapped.value;
                },
                child: Text("swap"),
              ),
            ), */
            Positioned(
              top: 20,
              right: 100,
              child: TextButton(
                onPressed: () {
                  swapped.value = !swapped.value;
                },
                child: Text("swap"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
