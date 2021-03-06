import 'package:geolocator/geolocator.dart';
import 'package:good_weather/apiclients/geocoding_api_client.dart';
import 'package:good_weather/dtos/geocoding/city_dto.dart';
import 'package:good_weather/mapper/city_to_entity_mapper.dart';
import 'package:good_weather/mapper/dto_to_city_mapper.dart';
import 'package:good_weather/mapper/entity_to_city_mapper.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/repositories/i_city_repository.dart';

import '../apiclients/geolocation_api_client.dart';
import '../models/coordinate.dart';
import '../persistance/weather_database.dart';

class CityRepository implements ICityRepository {
  CityRepository._();

  static final CityRepository _instance = CityRepository._();

  factory CityRepository() {
    return _instance;
  }

  final _dao = WeatherDatabase().cityDAO;
  final _cityToEntityMapper = CityToEntityMapper();
  final _entityToCityMapper = EntityToCityMapper();
  final _dtoToCityMapper = DTOtoCityMapper();

  @override
  Future<int> addCity(City city) async {
    final CityEntityCompanion cityEntity = _cityToEntityMapper.map(city);
    return _dao.insertCity(cityEntity);
  }

  @override
  Future<List<City>> getAllCities() async {
    List<CityEntityData> allCityEntities = await _dao.allCities;
    List<City> allCities =
        allCityEntities.map((e) => _entityToCityMapper.map(e)).toList();
    return allCities;
  }

  @override
  Future<City> getById(int id) async {
    City? city;
    CityEntityData? cityEntity = await _dao.getById(id);
    if (cityEntity == null) {
      throw Exception("No City for this id");
    }
    city = _entityToCityMapper.map(cityEntity);
    return city;
  }

  @override
  Future<List<City>> findCityByName(String cityName) async {
    final List<CityDTO> cityDTOList =
        await GeocodingAPIClient.getCityCoordinates(cityName);
    final List<City> cityList =
        cityDTOList.map((e) => _dtoToCityMapper.map(e)).toList();
    return cityList;
  }

  Future<City> findCityByCoordinates(double lat, double lon) async {
    final List<CityDTO> cityDTOList =
        await GeocodingAPIClient.getCityFromCoordinates(lat, lon, limit: 1);
    final List<City> cityList =
        cityDTOList.map((e) => _dtoToCityMapper.map(e)).toList();
    if (cityList.isEmpty) {
      return Future.error("No Cities found for Location!");
    }
    return cityList[0];
  }

  Future<City> findCityByUserLocation() async {
    Coordinate coordinate = await findLocation();
    City city = await findCityByCoordinates(coordinate.lat, coordinate.lon);
    return city;
  }

  @override
  Future<Coordinate> findLocation() async {
    final Position pos = await GeolocationApiClient.getCurrentPosition();
    return Coordinate(lat: pos.latitude, lon: pos.longitude);
  }

  @override
  Future<int> deleteAllCities() {
    return _dao.deleteAll();
  }

  @override
  Future<int> deleteCity(City city) {
    if (city.id == null) {
      throw Exception("Only Citys with Id, can get deleted!");
    }
    return _dao.deleteById(city.id!);
  }
}
