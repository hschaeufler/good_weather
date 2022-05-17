import 'package:good_weather/models/full_weather_data.dart';

import '../models/city.dart';
import '../models/weather_data.dart';
import '../repositories/city_repository.dart';
import '../repositories/weather_repository.dart';

class WeatherService {

  WeatherService._();

  static final WeatherService _instance = WeatherService._();

  factory WeatherService() {
    return _instance;
  }

  final CityRepository _cityRepository = CityRepository();
  final WeatherRepository _weatherRepository = WeatherRepository();

  Future<WeatherData> getWeather(City city) {
    return _weatherRepository.getCurrentWeather(city);
  }

  Future<FullWeatherData> getFullWeather(City city) {
    return _weatherRepository.getFullWeatherData(city);
  }

  Future<WeatherData> getWeatherByCityId(int cityId) {
    return _cityRepository
        .getById(cityId)
        .then((city) => _weatherRepository.getCurrentWeather(city));
  }

  Future<List<City>> getAllCities() {
    return _cityRepository.getAllCities();
  }



  Future<List<City>> deleteAllCities() async {
    await _cityRepository.deleteAllCities();
    return _cityRepository.getAllCities();
  }

  Future<List<City>> deleteCity(City city) async {
    await _cityRepository.deleteCity(city);
    return _cityRepository.getAllCities();
  }

  Future<int> addCityByLocation() async {
    City city = await _cityRepository.findCityByUserLocation();
    return _cityRepository.addCity(city);
  }

  Future<int> addCity(City city) async {
    return _cityRepository.addCity(city);
  }

  findCityByName(String text) {
    return _cityRepository.findCityByName(text);
  }
}
