import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:good_weather/pages/location_page.dart';
import 'package:good_weather/pages/weather_page.dart';
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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
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
