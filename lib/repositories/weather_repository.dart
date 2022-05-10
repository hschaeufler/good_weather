import 'package:good_weather/apiclients/weather_api_client.dart';
import 'package:good_weather/mapper/dto_to_weather_data_mapper.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/repositories/i_weather_repository.dart';

import '../dtos/weather/weather_data_dto.dart';
import '../models/weather_data.dart';


class WeatherRepository implements IWeatherRepository {

  WeatherRepository._();

  static final WeatherRepository _instance = WeatherRepository._();

  factory WeatherRepository() {
    return _instance;
  }

  final _dtoToWeatherDataMapper = DtoToWeatherDataMapper();

  @override
  Future<WeatherData> getCurrentWeather(City city) async {
    final WeatherDataDTO weatherDataDTO = await WeatherAPIClient.getWeather(city.lon, city.lat);
    final WeatherData weatherData = _dtoToWeatherDataMapper.map(weatherDataDTO);
    return weatherData;
  }

}