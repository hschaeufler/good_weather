import 'package:good_weather/dtos/weather/current/weather_data_dto.dart';
import 'package:good_weather/dtos/weather/forecast/one_call_weather_data_dto.dart';
import 'package:good_weather/mapper/dto_to_daily_forecast_data_mapper.dart';
import 'package:good_weather/mapper/i_mapper.dart';
import 'package:good_weather/models/daily_forecast_data.dart';
import 'package:good_weather/models/full_weather_data.dart';
import 'package:good_weather/models/weather_data.dart';

class DtoToFullWeatherDataMappper implements IMapper<OneCallWeatherDataDTO, FullWeatherData> {
  final DTOtoDailyForecastDataMapper _dtoToDailyForecastDataMapper =
      DTOtoDailyForecastDataMapper();

  @override
  FullWeatherData map(OneCallWeatherDataDTO source) {
    return FullWeatherData(
      dateTime: DateTime.fromMicrosecondsSinceEpoch(source.current.dt),
      temp: source.current.temp,
      description: source.current.weather[0].description,
      iconName: source.current.weather[0].icon,
      dailyForecast: source.daily.map<DailyForecastData>((dailyForecast) {
        return _dtoToDailyForecastDataMapper.map(dailyForecast);
      }).toList(),
    );
  }
}
