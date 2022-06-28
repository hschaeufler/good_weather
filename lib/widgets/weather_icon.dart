import 'package:flutter/widgets.dart';
import 'package:good_weather/utils/environment.dart';

class WeatherIcon extends StatelessWidget {
  final String iconName;
  final double scale;

  const WeatherIcon({required this.iconName, this.scale = 1, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      Environment.iconURL(iconName),
      scale: scale,
    );
  }
}
