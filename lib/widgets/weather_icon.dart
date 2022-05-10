import 'package:flutter/widgets.dart';
import 'package:good_weather/utils/environment.dart';

class WeatherIcon extends StatelessWidget {

  final String iconName;

  const WeatherIcon({required this.iconName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(Environment.iconURL(iconName));
  }
}
