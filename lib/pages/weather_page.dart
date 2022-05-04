import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_weather/repositories/city_repository.dart';

import '../models/city.dart';

class WeatherPage extends StatefulWidget {

  const WeatherPage({Key? key, this.cityid}) : super(key: key);

  final int? cityid;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  final CityRepository _cityRepository = CityRepository();

  Future<City?>? city;




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
    );
  }

  @override
  void initState() {
    super.initState();
    if(widget.cityid != null) {
      city = _cityRepository.getById(widget.cityid!);
    }
  }

  void _onAddLocation(context) {
    context.go('/addlocation');
  }
}
