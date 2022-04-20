import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  final _searchController = TextEditingController();

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
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.location_on),
              border: const OutlineInputBorder(),
              hintText: 'Search City',
              suffixIcon: IconButton(
                onPressed: _searchController.text.isNotEmpty ? _searchController.clear : null,
                icon: const Icon(Icons.clear),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _searchCity() {
    print(_searchController.text);
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

