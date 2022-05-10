import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:good_weather/models/city.dart';

import '../utils/country_code_to_flag.dart';

class CityTile extends StatelessWidget {
  final City city;
  final GestureTapCallback? onTap;
  final Widget? trailing;

  const CityTile({required this.city, this.onTap, this.trailing, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(city.name),
        dense: false,
        subtitle: city.state != null ? Text(city.state!) : null,
        leading: Text(
          countryCodeToFlag(city.country),
          style: const TextStyle(fontSize: 25),
        ),
        trailing: trailing,
        onTap: onTap);
  }
}
