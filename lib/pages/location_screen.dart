import 'package:flutter/material.dart';
import 'package:good_weather/models/city.dart';
import 'package:good_weather/services/geocoding_service.dart';

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
      body: Column(
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
                print(cityList.length);
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(cityList[index].name),
                        ));
              }
              return const CircularProgressIndicator();
            },
          )
        ],
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
