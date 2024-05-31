part of 'utils.dart';

convertKelvinToCelsius(dynamic kelvin) {
  if (kelvin == null || kelvin == '') return '';
  return (kelvin - 273.15).toStringAsFixed(2);
}
