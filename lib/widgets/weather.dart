import 'package:flutter/material.dart';
import 'package:good_weather/models/weather_data.dart';

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
        Text("${weatherData.temp} °",
            style: Theme.of(context).textTheme.headlineLarge),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("T: ${weatherData.minTemp} °",
                  style: Theme.of(context).textTheme.labelLarge),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("H: ${weatherData.maxTemp} °",
                  style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ],
    );
  }
}
