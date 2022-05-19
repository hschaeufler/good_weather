import 'package:flutter/widgets.dart';
import 'package:good_weather/models/daily_forecast_data.dart';
import 'package:good_weather/widgets/daily_forecast_tile.dart';

class DailyForecastListView extends StatelessWidget {
  final List<DailyForecastData> dailyForecastList;

  const DailyForecastListView({required this.dailyForecastList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return DailyForecastListTile(
            dailyForecast: dailyForecastList[index],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: dailyForecastList.length,
        shrinkWrap: true,
      ),
      size: const Size.square(227),
    );
  }
}
