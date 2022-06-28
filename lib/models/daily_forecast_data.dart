import 'package:good_weather/models/abstract_weather.dart';

class DailyForecastData extends AbstractWeather {
  final double? minTemp;
  final double? maxTemp;

  DailyForecastData({
    required DateTime dateTime,
    required String iconName,
    required String description,
    required double temp,
    this.minTemp,
    this.maxTemp,
  }) : super(
          dateTime: dateTime,
          iconName: iconName,
          description: description,
          temp: temp,
        );
}
