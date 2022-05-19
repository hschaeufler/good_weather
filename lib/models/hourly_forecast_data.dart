import 'package:good_weather/models/abstract_weather.dart';

class HourlyForecastData extends AbstractWeather {
  HourlyForecastData(
      {required DateTime dateTime,
      required String iconName,
      required String description,
      required double temp})
      : super(
            dateTime: dateTime,
            iconName: iconName,
            description: description,
            temp: temp);
}
