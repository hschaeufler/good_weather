import 'package:flutter/material.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/models/city_image_data.dart';
import 'package:good_weather/models/full_weather_data.dart';
import 'package:good_weather/widgets/daily_forecast_list_view.dart';
import 'package:good_weather/widgets/hourly_forecast_list_view.dart';

import '../models/weather_data.dart';
import '../services/weather_service.dart';
import '../widgets/weather.dart';

class WeatherPageScreen extends StatefulWidget {
  final City city;

  const WeatherPageScreen({required this.city, Key? key}) : super(key: key);

  @override
  State<WeatherPageScreen> createState() => _WeatherPageScreenState();
}

class _WeatherPageScreenState extends State<WeatherPageScreen> {
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
          CityImageData image = snapshot.data[2];
          return RefreshIndicator(
            onRefresh: () async {
              _fetchWeatherData();
            },
            child: Container(
              child: DraggableScrollableSheet(
                  minChildSize: 0.5,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return ListView(
                      controller: scrollController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Weather(weatherData: weather),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, bottom: 25, left: 10, right: 10),
                          child: HourlyForecastListView(
                              hourlyForecastList: fullWeather.hourlyForecast),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, bottom: 25, left: 10, right: 10),
                          child: DailyForecastListView(
                              dailyForecastList: fullWeather.dailyForecast),
                        ),
                      ],
                    );
                  }),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image.mobile), fit: BoxFit.cover),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  _fetchWeatherData() {
    setState(() {
      weatherData = Future.wait([
        _weatherService.getWeather(widget.city),
        _weatherService.getFullWeather(widget.city),
        _weatherService.getCityImage(widget.city),
      ]);
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }
}
