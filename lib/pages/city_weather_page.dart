import 'package:flutter/material.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/models/full_weather_data.dart';
import 'package:good_weather/widgets/daily_forecast_list_view.dart';
import 'package:good_weather/widgets/hourly_forecast_list_view.dart';

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

  Future<List<Object>>? weatherData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weatherData,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error!.toString());
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          WeatherData weather = snapshot.data[0];
          FullWeatherData fullWeather = snapshot.data[1];
          return RefreshIndicator(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Weather(weatherData: weather),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 25, left: 10, right: 10),
                    child: HourlyForecastListView(hourlyForecastList: fullWeather.hourlyForecast),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 25, left: 10, right: 10),
                    child: DailyForecastListView(dailyForecastList: fullWeather.dailyForecast),
                  ),
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
        weatherData = Future.wait([_weatherService.getWeather(widget.city), _weatherService.getFullWeather(widget.city)]);
      });
  }

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

}
