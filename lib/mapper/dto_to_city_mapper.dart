import 'package:good_weather/dtos/geocoding/city_dto.dart';
import 'package:good_weather/mapper/i_mapper.dart';
import 'package:good_weather/models/city.dart';

class DTOtoCityMapper implements IMapper<CityDTO, City> {
  @override
  City map(CityDTO source) {
    return City(
        name: source.name,
        lat: source.lat,
        lon: source.lon,
        country: source.country,
        state: source.state);
  }
}
