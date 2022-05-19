import 'package:flutter/widgets.dart';
import 'package:good_weather/models/daily_forecast_data.dart';
import 'package:good_weather/models/hourly_forecast_data.dart';
import 'package:good_weather/widgets/daily_forecast_tile.dart';
import 'package:good_weather/widgets/hourly_forecast_tile.dart';

class HourlyForecastListView extends StatelessWidget {
  final List<HourlyForecastData> hourlyForecastList;

  const HourlyForecastListView({required this.hourlyForecastList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return HourlyForecastListTile(
            hourlyForecastData: hourlyForecastList[index],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: hourlyForecastList.length,
        shrinkWrap: true,
      ),
      size: const Size.square(101),
    );
  }
}
