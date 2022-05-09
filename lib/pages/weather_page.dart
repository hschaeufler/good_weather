import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_weather/models/weather_data.dart';
import 'package:good_weather/repositories/city_repository.dart';
import 'package:good_weather/repositories/weather_repository.dart';
import 'package:good_weather/widgets/weather.dart';
import 'package:good_weather/widgets/weather_icon.dart';


class WeatherPage extends StatefulWidget {
  const WeatherPage({this.cityId, Key? key}) : super(key: key);

  final int? cityId;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final CityRepository _cityRepository = CityRepository();
  final WeatherRepository _weatherRepository = WeatherRepository();

  Future<WeatherData>? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Good Weather!"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/addlocation'),
        tooltip: 'Add Location',
        child: const Icon(Icons.add_location),
      ),
      body: FutureBuilder(
        future: weatherData,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error!.toString());
          } else if(snapshot.hasData) {
              WeatherData weather = snapshot.data;
              return Weather(weatherData: weather);
          }
          return const Center(child: CircularProgressIndicator());
        },),
    );
  }
  _fetchWeatherData() {
    if(widget.cityId != null) {
      weatherData = _cityRepository
          .getById(widget.cityId!)
          .then((city) => _weatherRepository.getCurrentWeather(city));
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }


  @override
  void didUpdateWidget(WeatherPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.cityId != widget.cityId) {
      _fetchWeatherData();
    }
  }

}
