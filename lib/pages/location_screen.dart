import 'package:flutter/material.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/services/geocoding_service.dart';
import 'package:good_weather/utils/country_code_to_flag.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _searchController = TextEditingController();
  Future<List<City>>? futureCityList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Location"),
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
                hintText: 'Search City',
                suffixIcon: IconButton(
                  onPressed: _searchController.text.isNotEmpty
                      ? _searchController.clear
                      : null,
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            FutureBuilder(
              future: futureCityList,
              builder:
                  (BuildContext context, AsyncSnapshot<List<City>> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Ein Fehler ist aufgetreten');
                } else if (snapshot.hasData) {
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
                        );
                      });
                }
                return const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _searchCity() {
    if (_searchController.text.isNotEmpty) {
      futureCityList =
          GeocodingService.getCityCoordinates(_searchController.text);
    }
    setState(() {});
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
