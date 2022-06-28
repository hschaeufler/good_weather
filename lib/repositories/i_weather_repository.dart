import 'package:good_weather/models/full_weather_data.dart';
import 'package:good_weather/models/weather_data.dart';

import '../models/city.dart';

abstract class IWeatherRepository {
  Future<WeatherData> getCurrentWeather(City city);
  Future<FullWeatherData> getFullWeatherData(City city);
}
