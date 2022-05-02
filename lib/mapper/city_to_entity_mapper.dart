import 'package:good_weather/mapper/i_mapper.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/persistance/weather_database.dart';

class CityToEntityMapper implements IMapper<City, CityEntityCompanion> {

  @override
  CityEntityCompanion map(City source) {
    return CityEntityCompanion.insert(
        name: source.name,
        lat: source.lat,
        long: source.lon,
        country: source.country,
    );
  }
}
