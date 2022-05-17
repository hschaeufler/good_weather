import 'package:good_weather/dtos/weather/forecast/daily_forecast_data_dto.dart';
import 'package:good_weather/mapper/i_mapper.dart';
import 'package:good_weather/models/daily_forecast_data.dart';

class DTOtoDailyForecastDataMapper
    extends IMapper<DailyForecastDataDTO, DailyForecastData> {
  @override
  DailyForecastData map(DailyForecastDataDTO source) {
    return DailyForecastData(
      dateTime: DateTime.fromMicrosecondsSinceEpoch(source.dt),
      iconName: source.weather[0].icon,
      description: source.weather[0].description,
      temp: source.temp.day,
      maxTemp: source.temp.max,
      minTemp: source.temp.min,
    );
  }
}
