import 'package:flutter/material.dart';
import 'package:good_weather/screens/parallax_flow_delegate.dart';
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

  final GlobalKey _backgroundImageKey = GlobalKey();
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();

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
            child: Stack(
              children: [
                Flow(
                  delegate: ParallaxFlowDelegate(
                    backgroundImageKey: _backgroundImageKey,
                    buildContext: context,
                    controller: _scrollController,
                  ),
                  children: [
                    Transform.scale(
                      scale: 1.1,
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        key: _backgroundImageKey,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(image.mobile),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                DraggableScrollableSheet(
                    controller: _scrollController,
                    minChildSize: 0.5,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(0.05), Colors.black.withOpacity(0.3)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        child: ListView(
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
                                  hourlyForecastList:
                                      fullWeather.hourlyForecast),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 25, bottom: 25, left: 10, right: 10),
                              child: DailyForecastListView(
                                  dailyForecastList: fullWeather.dailyForecast),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
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
