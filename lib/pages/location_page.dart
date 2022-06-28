import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_weather/services/weather_service.dart';
import 'package:good_weather/utils/country_code_to_flag.dart';

import '../models/city.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final _searchController = TextEditingController();
  final _weatherService = WeatherService();

  Future<List<City>>? futureCityList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Standort hinzufügen"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _goBack();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                textInputAction: TextInputAction.search,
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on),
                  border: const OutlineInputBorder(),
                  hintText: 'Ort eingeben',
                  suffixIcon: IconButton(
                    onPressed: _searchController.text.isNotEmpty
                        ? _searchController.clear
                        : null,
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
              if (futureCityList != null)
                FutureBuilder(
                  future: futureCityList,
                  builder:
                      (BuildContext context, AsyncSnapshot<List<City>> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Ein Fehler ist aufgetreten');
                    } else if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      final List<City> cityList = snapshot.data!;
                      return ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                                height: 0,
                              ),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final City currentCity = cityList[index];
                            return ListTile(
                              title: Text(currentCity.name),
                              dense: false,
                              subtitle: currentCity.state != null
                                  ? Text(currentCity.state!)
                                  : null,
                              leading: Text(
                                countryCodeToFlag(currentCity.country),
                                style: const TextStyle(fontSize: 25),
                              ),
                              onTap: () => _onCitySelect(currentCity),
                            );
                          });
                    }
                    return const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              else ...[
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("oder"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _onAddLocation();
                  },
                  label: const Text("Aktuellen Standort verwenden"),
                  icon: const Icon(Icons.navigation_rounded),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _searchCity() {
    setState(() {
      futureCityList = _searchController.text.isNotEmpty
          ? _weatherService.findCityByName(_searchController.text)
          : null;
    });
  }

  void _goBack() {
    GoRouter.of(context).go("/");
  }

  Future<void> _onCitySelect(City city) async {
    final id = await _weatherService.addCity(city);
    GoRouter.of(context).go("/weather/$id");
  }

  Future<void> _onAddLocation() async {
    _weatherService
        .addCityByLocation()
        .then((id) => GoRouter.of(context).go("/weather/$id"))
        .catchError((error) {
          debugPrint(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchCity);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
