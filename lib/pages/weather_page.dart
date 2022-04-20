import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Good Weather!"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _onAddLocation(context),
        tooltip: 'Add Location',
        child: const Icon(Icons.add_location),
      ),
    );
  }

  void _onAddLocation(context) {
    Navigator.pushNamed(context, '/addlocation');
  }
}
