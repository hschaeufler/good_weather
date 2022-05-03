import 'package:good_weather/mapper/i_mapper.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/persistance/weather_database.dart';

class EntityToCityMapper implements IMapper<CityEntityData, City> {

  @override
  City map(CityEntityData source) {
    return City(
      id: source.id,
      name: source.name,
      lat: source.lat,
      lon: source.long,
      country: source.country,
      state: source.state,
    );
  }
}
