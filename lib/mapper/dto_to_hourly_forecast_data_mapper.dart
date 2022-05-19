import 'package:good_weather/dtos/weather/forecast/daily_forecast_data_dto.dart';
import 'package:good_weather/dtos/weather/forecast/hourly_forecast_data_dto.dart';
import 'package:good_weather/mapper/i_mapper.dart';
import 'package:good_weather/models/daily_forecast_data.dart';
import 'package:good_weather/models/hourly_forecast_data.dart';
import 'package:good_weather/utils/date_utils.dart';

class DTOtoHourlyForecastDataMapper
    extends IMapper<HourlyForecastDataDTO, HourlyForecastData> {
  @override
  HourlyForecastData map(HourlyForecastDataDTO source) {
    return HourlyForecastData(
      dateTime: fromSecondsSinceEpoch(source.dt),
      iconName: source.weather[0].icon,
      description: source.weather[0].description,
      temp: source.temp,
    );
  }
}
