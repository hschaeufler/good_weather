import 'package:good_weather/models/city.dart';

abstract class ICityRepository {
  Future<List<City>> getAllCities();
  Future<int> addCity(City city);
  Future<List<City>> findCity(String cityName);
}