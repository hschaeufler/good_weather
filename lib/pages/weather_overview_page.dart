import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/pages/city_weather_page.dart';
import 'package:good_weather/services/weather_service.dart';

import '../widgets/city_drawer.dart';

class WeatherOverviewPage extends StatefulWidget {
  const WeatherOverviewPage({this.cityId, Key? key}) : super(key: key);

  final int? cityId;

  @override
  State<WeatherOverviewPage> createState() => _WeatherOverviewPageState();
}

class _WeatherOverviewPageState extends State<WeatherOverviewPage> {
  final WeatherService _weatherService = WeatherService();
  final PageController _controller = PageController();

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
              return PageView.builder(
                  itemCount: cityList.length,
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) {
                    final City city = cityList[index];
                    return CityWeatherPage(city: city);
                  });
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(WeatherOverviewPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.cityId != null) {
      cities?.then((List<City> cityList) {
        int id = cityList.indexWhere((city) => city.id == widget.cityId);
        _controller.jumpToPage(id);
      });
    }
  }
}
