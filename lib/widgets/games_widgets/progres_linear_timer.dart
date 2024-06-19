part of '../widgets.dart';

class ProgressLinearTimer extends StatefulWidget {
  final int durationMilliseconds;
  final Function onTimerFinish;
  final EdgeInsetsGeometry? margin;
  final double height;
  const ProgressLinearTimer({
    super.key,
    required this.durationMilliseconds,
    required this.onTimerFinish,
    this.margin,
    this.height = 10,
  });

  @override
  _ProgressLinearTimerState createState() => _ProgressLinearTimerState();
}

class _ProgressLinearTimerState extends State<ProgressLinearTimer> {
  late int _millisecondsRemaining;
  late double _barWidth;
  int durationMilliseconds = 17;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    _millisecondsRemaining = widget.durationMilliseconds;
    _barWidth = 1.0;
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer =
        Timer.periodic(Duration(milliseconds: durationMilliseconds), (timer) {
      if (mounted) {
        setState(() {
          if (_millisecondsRemaining > 0) {
            _millisecondsRemaining -= durationMilliseconds;
            _barWidth = _millisecondsRemaining <= 0
                ? 0
                : _millisecondsRemaining / widget.durationMilliseconds;
          } else {
            widget.onTimerFinish();
            timer.cancel();
          }
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorSchema = Theme.of(context).colorScheme;
    Color getColorByTimeLeft() {
      final double percentage =
          _millisecondsRemaining / widget.durationMilliseconds;

      if (percentage > 0.6) {
        return Colors.green; // Color verde si queda más del 60% del tiempo
      }
      if (percentage > 0.3) {
        // Color amarillo si queda entre el 30% y el 60% del tiempo
        return Colors.yellow;
      }
      return Colors.red; // Color rojo si queda menos del 30% del tiempo
    }

    return Stack(
      children: [
        Container(
          margin: widget.margin,
          height: widget.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: colorSchema.primary,
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: _barWidth,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: getColorByTimeLeft(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
