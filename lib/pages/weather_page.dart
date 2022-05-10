import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/models/weather_data.dart';
import 'package:good_weather/services/weather_service.dart';
import 'package:good_weather/widgets/city_tile.dart';
import 'package:good_weather/widgets/weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({this.cityId, Key? key}) : super(key: key);

  final int? cityId;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherService _weatherService = WeatherService();

  Future<WeatherData>? weatherData;
  Future<List<City>>? cities;

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
          } else if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            WeatherData weather = snapshot.data;
            return RefreshIndicator(
                child: ListView(
                  children: [Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Weather(weatherData: weather),
                  )],
                ),
                onRefresh: () async {
                  _fetchWeatherData();
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      drawer: Drawer(
          child: FutureBuilder(
        future: cities,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error!.toString());
          } else if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            List<City> cityList = snapshot.data;
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final City currentCity = cityList[index];
                return Dismissible(
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  direction: cityList.length > 1
                      ? DismissDirection.endToStart
                      : DismissDirection.none,
                  key: ValueKey<int>(currentCity.id!),
                  child: CityTile(
                    city: currentCity,
                    onTap: () => _onCitySelected(currentCity, context),
                  ),
                  onDismissed: (direction) => _deleteCity(currentCity),
                );
              },
              shrinkWrap: true,
              itemCount: cityList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 0,
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      )),
    );
  }

  _fetchWeatherData() {
    if (widget.cityId != null) {
      setState(() {
        weatherData = _weatherService.getWeatherByCityId(widget.cityId!);
      });
    }
  }

  _fetchCities() {
    setState(() {
      cities = _weatherService.getAllCities();
    });
  }

  _deleteCity(City city) {
    setState(() {
      cities = _weatherService.deleteCity(city);
    });
  }

  _onCitySelected(City city, BuildContext context) {
    Navigator.of(context).pop();
    GoRouter.of(context).go("/weather/${city.id}");
  }

  _fetchInitialData() {
    _fetchCities();
    if (widget.cityId != null) {
      _fetchWeatherData();
    } else {
      cities?.then((cities) {
        if (cities.isEmpty) {
          GoRouter.of(context).go("/addlocation");
        } else {
          GoRouter.of(context).go("/weather/${cities[0].id}");
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  @override
  void didUpdateWidget(WeatherPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cityId != widget.cityId) {
      _fetchInitialData();
    }
  }
}
