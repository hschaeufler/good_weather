import 'package:good_weather/dtos/weather/current/weather_data_dto.dart';
import 'package:good_weather/dtos/weather/forecast/one_call_weather_data_dto.dart';
import 'package:good_weather/mapper/dto_to_daily_forecast_data_mapper.dart';
import 'package:good_weather/mapper/dto_to_hourly_forecast_data_mapper.dart';
import 'package:good_weather/mapper/i_mapper.dart';
import 'package:good_weather/models/daily_forecast_data.dart';
import 'package:good_weather/models/full_weather_data.dart';
import 'package:good_weather/models/hourly_forecast_data.dart';
import 'package:good_weather/models/weather_data.dart';

import '../utils/date_utils.dart';

class DtoToFullWeatherDataMappper implements IMapper<OneCallWeatherDataDTO, FullWeatherData> {
  final DTOtoDailyForecastDataMapper _dtoToDailyForecastDataMapper =
      DTOtoDailyForecastDataMapper();
  final DTOtoHourlyForecastDataMapper _dtoToHourlyForecastDataMapper =
  DTOtoHourlyForecastDataMapper();


  @override
  FullWeatherData map(OneCallWeatherDataDTO source) {
    return FullWeatherData(
      dateTime: fromSecondsSinceEpoch(source.current.dt),
      temp: source.current.temp,
      description: source.current.weather[0].description,
      iconName: source.current.weather[0].icon,
      dailyForecast: source.daily.map<DailyForecastData>((dailyForecast) {
        return _dtoToDailyForecastDataMapper.map(dailyForecast);
      }).toList(),
      hourlyForecast: source.hourly.map<HourlyForecastData>((hourlyForecast) {
        return _dtoToHourlyForecastDataMapper.map(hourlyForecast);
      }).toList(),
    );
  }
}
