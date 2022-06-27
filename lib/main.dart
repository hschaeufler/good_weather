import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:good_weather/pages/location_page.dart';
import 'package:good_weather/pages/weather_page.dart';
import 'package:good_weather/themes/custom_weather_theme.dart';
import 'package:good_weather/utils/environment.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';


Future<void> main() async {
  await dotenv.load(
    fileName: Environment.envFileName,
  );
  String locale = await findSystemLocale();
  initializeDateFormatting(locale);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Weather App',
      theme: CustomWeatherTheme.light,
      darkTheme: CustomWeatherTheme.dark,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const WeatherPage(),
      ),
      GoRoute(
          path: '/weather/:cityid',
          builder: (BuildContext context, GoRouterState state) {
            int? cityId = state.params['cityid'] != null ? int.parse(state.params['cityid']!) : null;
            return WeatherPage(cityId: cityId);
          }),
      GoRoute(
        path: '/addlocation',
        builder: (BuildContext context, GoRouterState state) =>
            const LocationPage(),
      ),
    ],
  );
}
