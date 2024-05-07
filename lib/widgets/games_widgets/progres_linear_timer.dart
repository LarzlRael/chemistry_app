part of '../widgets.dart';

class ProgresLinearTimer extends StatefulWidget {
  final int durationMiliseconds;
  final Function onTimerFinish;
  final EdgeInsetsGeometry? margin;
  final double height;
  const ProgresLinearTimer({
    super.key,
    required this.durationMiliseconds,
    required this.onTimerFinish,
    this.margin,
    this.height = 10,
  });

  @override
  _ProgresLinearTimerState createState() => _ProgresLinearTimerState();
}

class _ProgresLinearTimerState extends State<ProgresLinearTimer> {
  late int _milisecondsRemaining;
  late double _barWidth;
  int durationMiliseconds = 17;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    _milisecondsRemaining = widget.durationMiliseconds;
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
        Timer.periodic(Duration(milliseconds: durationMiliseconds), (timer) {
      if (mounted) {
        setState(() {
          if (_milisecondsRemaining > 0) {
            _milisecondsRemaining -= durationMiliseconds;
            _barWidth = _milisecondsRemaining <= 0
                ? 0
                : _milisecondsRemaining / widget.durationMiliseconds;
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
    Color getColorByTimeLeft() {
      final double percentage =
          _milisecondsRemaining / widget.durationMiliseconds;

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
            color: primaryColor,
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
