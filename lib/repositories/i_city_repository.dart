import 'package:good_weather/models/city.dart';

import '../models/coordinate.dart';

abstract class ICityRepository {
  Future<List<City>> getAllCities();
  Future<City> getById(int id);
  Future<int> addCity(City city);
  Future<List<City>> findCityByName(String cityName);
  Future<int> deleteCity(City city);
  Future<int> deleteAllCities();
  Future<Coordinate> findLocation();
}
