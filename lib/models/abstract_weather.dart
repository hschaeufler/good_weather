abstract class AbstractWeather {
  final DateTime dateTime;
  final String iconName;
  final String description;
  final double temp;

  AbstractWeather(
      {required this.dateTime,
      required this.iconName,
      required this.description,
      required this.temp});
}
