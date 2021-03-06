import 'package:good_weather/dtos/weather/current/weather_data_dto.dart';
import 'package:good_weather/mapper/i_mapper.dart';
import 'package:good_weather/models/weather_data.dart';

class DtoToWeatherDataMapper implements IMapper<WeatherDataDTO, WeatherData> {
  @override
  WeatherData map(WeatherDataDTO source) {
    return WeatherData(
      iconName: source.weather[0].icon,
      description: source.weather[0].description,
      temp: source.main.temp,
      minTemp: source.main.tempMin,
      maxTemp: source.main.tempMax,
      cityName: source.name,
    );
  }
}
