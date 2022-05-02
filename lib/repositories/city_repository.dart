import 'package:good_weather/dtos/city_dto.dart';
import 'package:good_weather/mapper/city_to_entity_mapper.dart';
import 'package:good_weather/mapper/dto_to_city_mapper.dart';
import 'package:good_weather/mapper/entity_to_city_mapper.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/repositories/i_city_repository.dart';
import '../persistance/weather_database.dart';
import '../services/geocoding_api_client.dart';

class CityRepository implements ICityRepository {
  final _dao = WeatherDatabase().cityDAO;
  final cityToEntityMapper = CityToEntityMapper();
  final entityToCityMapper = EntityToCityMapper();
  final dtoToCityMapper = DTOtoCityMapper();

  @override
  Future<int> addCity(City city) async {
    final CityEntityCompanion cityEntity = cityToEntityMapper.map(city);
    return _dao.insertCity(cityEntity);
  }

  @override
  Future<List<City>> getAllCities() async {
    List<CityEntityData> allCityEntities = await _dao.allCities;
    List<City> allCities =
        allCityEntities.map((e) => entityToCityMapper.map(e)).toList();
    return allCities;
  }

  @override
  Future<List<City>> findCity(String cityName) async {
    final List<CityDTO> cityDTOList = await GeocodingAPIClient.getCityCoordinates(cityName);
    final List<City> cityList = cityDTOList.map((e) => dtoToCityMapper.map(e)).toList();
    return cityList;
  }

}
