import 'package:flutter/material.dart';
import 'package:good_weather/models/city.dart';

import '../models/weather_data.dart';
import '../services/weather_service.dart';
import '../widgets/weather.dart';

class CityWeatherPage extends StatefulWidget {

  final City city;

  const CityWeatherPage({required this.city, Key? key}) : super(key: key);

  @override
  State<CityWeatherPage> createState() => _CityWeatherPageState();
}

class _CityWeatherPageState extends State<CityWeatherPage> {

  final WeatherService _weatherService = WeatherService();

  Future<WeatherData>? weatherData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weatherData,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error!.toString());
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          WeatherData weather = snapshot.data;
          return RefreshIndicator(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Weather(weatherData: weather),
                  )
                ],
              ),
              onRefresh: () async {
                _fetchWeatherData();
              });
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  _fetchWeatherData() {
      setState(() {
        weatherData = _weatherService.getWeather(widget.city);
      });
  }

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

}