/* part of 'sensors.dart';

class GyroscopeXYZ {
  final double x;
  final double y;
  final double z;
  GyroscopeXYZ(this.x, this.y, this.z);
  @override
  toString() => 'x: $x, y: $y, z: $z';
}

final gyroscopeProvider = StreamProvider<GyroscopeXYZ>((ref) async* {
  await for (final gyroscopeData in gyroscopeEventStream()) {
    final x = double.parse(gyroscopeData.x.toStringAsFixed(2));
    final y = double.parse(gyroscopeData.y.toStringAsFixed(2));
    final z = double.parse(gyroscopeData.z.toStringAsFixed(2));

    yield GyroscopeXYZ(x, y, z);
  }
});
final gyroscopeProviderGravity = StreamProvider<GyroscopeXYZ>((ref) async* {
  await for (final gyroscopeData in gyroscopeEventStream()) {
    final x = double.parse(gyroscopeData.x.toStringAsFixed(2));
    final y = double.parse(gyroscopeData.y.toStringAsFixed(2));
    final z = double.parse(gyroscopeData.z.toStringAsFixed(2));

    yield GyroscopeXYZ(x, y, z);
  }
});
 */