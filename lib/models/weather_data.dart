class WeatherData {
  final String iconName;
  final String description;
  final double temp;
  final double? minTemp;
  final double? maxTemp;
  final String cityName;

  WeatherData(
      {required this.iconName,
      required this.description,
      required this.temp,
      this.minTemp,
      this.maxTemp,
      required this.cityName});
}
