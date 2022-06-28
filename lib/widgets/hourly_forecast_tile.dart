import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:good_weather/models/hourly_forecast_data.dart';
import 'package:good_weather/utils/degree_utils.dart';
import 'package:intl/intl.dart';

import 'weather_icon.dart';

class HourlyForecastListTile extends StatelessWidget {
  final HourlyForecastData hourlyForecastData;


  const HourlyForecastListTile({required this.hourlyForecastData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text( DateFormat(DateFormat.HOUR24).format(hourlyForecastData.dateTime),
            style: Theme.of(context).textTheme.labelLarge),
        WeatherIcon(iconName: hourlyForecastData.iconName, scale: 1.5,),
        Text(formatDegree(hourlyForecastData.temp),
            style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }


}
