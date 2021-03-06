import 'package:flutter/material.dart';
import 'package:good_weather/models/weather_data.dart';

import '../utils/degree_utils.dart';
import 'weather_icon.dart';

class Weather extends StatelessWidget {
  final WeatherData weatherData;

  const Weather({required this.weatherData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(weatherData.cityName,
            style: Theme.of(context).textTheme.headlineSmall),
        WeatherIcon(iconName: weatherData.iconName),
        Text(weatherData.description,
            style: Theme.of(context).textTheme.labelLarge),
        Text(formatDegree(weatherData.temp),
            style: Theme.of(context).textTheme.headlineLarge),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("T: ${formatDegree(weatherData.minTemp)}",
                  style: Theme.of(context).textTheme.labelLarge),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("H: ${formatDegree(weatherData.maxTemp)}",
                  style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ],
    );
  }
}
