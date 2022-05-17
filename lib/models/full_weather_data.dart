import 'package:good_weather/models/daily_forecast_data.dart';
import 'package:good_weather/models/abstract_weather.dart';

class FullWeatherData extends AbstractWeather {
  final List<DailyForecastData> dailyForecast;

  FullWeatherData({
    required DateTime dateTime,
    required String iconName,
    required String description,
    required double temp,
    required this.dailyForecast,
  }) : super(
    dateTime: dateTime,
    iconName: iconName,
    description: description,
    temp: temp,
  );
}
