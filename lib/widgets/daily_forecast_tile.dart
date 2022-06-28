import 'package:flutter/material.dart';
import 'package:good_weather/models/daily_forecast_data.dart';
import 'package:good_weather/utils/degree_utils.dart';
import 'package:intl/intl.dart';

import 'weather_icon.dart';

class DailyForecastListTile extends StatelessWidget {
  final DailyForecastData dailyForecast;

  const DailyForecastListTile({required this.dailyForecast, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(DateFormat(DateFormat.ABBR_WEEKDAY).format(dailyForecast.dateTime),
            style: Theme.of(context).textTheme.headlineSmall),
        WeatherIcon(iconName: dailyForecast.iconName),
        Text(dailyForecast.description,
            style: Theme.of(context).textTheme.labelLarge),
        Text(formatDegree(dailyForecast.temp),
            style: Theme.of(context).textTheme.headlineLarge),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("T: ${formatDegree(dailyForecast.minTemp)}",
                  style: Theme.of(context).textTheme.labelLarge),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("H: ${formatDegree(dailyForecast.maxTemp)}",
                  style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ],
    );
  }
}
