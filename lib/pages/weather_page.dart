import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/screens/weather_page_view_screen.dart';
import 'package:good_weather/services/weather_service.dart';

import '../widgets/city_drawer.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({this.cityId, Key? key}) : super(key: key);

  final int? cityId;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherService _weatherService = WeatherService();

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
          future: cities,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error!.toString());
            } else if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              final List<City> cityList = snapshot.data;
              return WeatherPageViewScreen(
                cityList: cityList,
                cityId: widget.cityId,
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        drawer: CityDrawer(
          cityList: cities,
          onCitySelected: _onCitySelected,
          onCityDeleted: _deleteCity,
        ));
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

  _onCitySelected(City city) {
    Navigator.of(context).pop();
    GoRouter.of(context).go("/weather/${city.id}");
  }

  @override
  void initState() {
    super.initState();
    _fetchCities();
  }

  @override
  void didUpdateWidget(WeatherPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _fetchCities();
  }
}
