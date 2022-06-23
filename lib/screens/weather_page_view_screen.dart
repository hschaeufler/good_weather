import 'package:flutter/widgets.dart';

import '../models/city.dart';
import 'weather_page_screen.dart';

class WeatherPageViewScreen extends StatefulWidget {
  final List<City> cityList;
  final int? cityId;

  const WeatherPageViewScreen({
    required this.cityList,
    this.cityId,
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherPageViewScreen> createState() => _WeatherPageViewScreenState();
}

class _WeatherPageViewScreenState extends State<WeatherPageViewScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: widget.cityList.length,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          final City city = widget.cityList[index];
          return WeatherPageScreen(city: city);
        });
  }

  @override
  void didUpdateWidget(WeatherPageViewScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget-cwpw");
    if (widget.cityId != null) {
      _jumpToCity(widget.cityId!);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _jumpToCity(int cityId){
    int index = widget.cityList.indexWhere((city) => city.id == cityId);
    if(_controller.hasClients) {
      _controller.jumpToPage(index);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.cityId != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _jumpToCity(widget.cityId!);
      });
    }
  }
}
