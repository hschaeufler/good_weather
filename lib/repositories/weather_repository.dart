import 'package:good_weather/apiclients/weather_api_client.dart';
import 'package:good_weather/dtos/weather/forecast/one_call_weather_data_dto.dart';
import 'package:good_weather/mapper/dto_to_weather_data_mapper.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/models/full_weather_data.dart';
import 'package:good_weather/repositories/i_weather_repository.dart';

import '../dtos/weather/current/weather_data_dto.dart';
import '../mapper/dto_to_full_weather_data_mapper.dart';
import '../models/weather_data.dart';

class WeatherRepository implements IWeatherRepository {
  WeatherRepository._();

  static final WeatherRepository _instance = WeatherRepository._();

  factory WeatherRepository() {
    return _instance;
  }

  final _dtoToWeatherDataMapper = DtoToWeatherDataMapper();
  final _dtoToFullWeatherDataMapper = DtoToFullWeatherDataMappper();

  @override
  Future<WeatherData> getCurrentWeather(City city) async {
    final WeatherDataDTO weatherDataDTO =
        await WeatherAPIClient.getCurrentWeather(city.lon, city.lat);
    final WeatherData weatherData = _dtoToWeatherDataMapper.map(weatherDataDTO);
    return weatherData;
  }

  @override
  Future<FullWeatherData> getFullWeatherData(City city) async {
    final OneCallWeatherDataDTO oneCallWeatherDataDTO =
        await WeatherAPIClient.getOneCallWeatherData(city.lon, city.lat);
    final FullWeatherData fullWeatherData =
        _dtoToFullWeatherDataMapper.map(oneCallWeatherDataDTO);
    return fullWeatherData;
  }
}
