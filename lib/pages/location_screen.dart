import 'package:flutter/material.dart';
import 'package:good_weather/repositories/city_repository.dart';
import 'package:good_weather/utils/country_code_to_flag.dart';
import '../models/city.dart';

class LocationScreen extends StatefulWidget {

  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _searchController = TextEditingController();
  final _cityRepository = CityRepository();

  Future<List<City>>? futureCityList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Standort hinzufügen"),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
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
                onPressed: () {},
                label: const Text("Aktuellen Standort verwenden"),
                icon: const Icon(Icons.navigation_rounded),
              )
            ]
          ],
        ),
      ),
    );
  }

  void _searchCity() {
    setState(() {
      futureCityList = _searchController.text.isNotEmpty
          ? _cityRepository.findCity(_searchController.text)
          : null;
    });
  }

  Future<void> _onCitySelect(City city) async {
    final id = await _cityRepository.addCity(city);
    print(id);
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
