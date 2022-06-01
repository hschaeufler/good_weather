import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get envFileName => "assets/env/" + (kReleaseMode ? "prod.env" : "dev.env");
  static String get apiToken => dotenv.env['API_TOKEN'] ?? '';
  static String get openWeatherApiEndpoint => dotenv.env['OPEN_WEAHTER_API_ENDPOINT'] ?? '';
  static String get teleportApiEndpoint => dotenv.env['TELEPORT_API_ENDPOINT'] ?? '';
  static String get geoCodeAPIPath => dotenv.env['GEOCODE_API_PATH'] ?? '';
  static String get reverseGeoCodeAPIPath => dotenv.env['REVERSE_GEO_API_PATH'] ?? '';
  static String get weatherAPIPath => dotenv.env['WEATHER_API_PATH'] ?? '';
  static String get forecastAPIPath => dotenv.env['FORECAST_API_PATH'] ?? '';
  static String get teleportLocationsAPIPath => dotenv.env['TELEPORT_LOCATIONS_API_PATH'] ?? '';
  static String get teleportImagesSuffix => dotenv.env['TELEPORT_LOCATIONS_API_PATH'] ?? '';
  static String get iconBaseURL => dotenv.env['ICON_SERVICE_URL'] ?? '';
  static String get geoCodeBaseURL => openWeatherApiEndpoint + geoCodeAPIPath;
  static String get reverseGeoCodeBaseURL => openWeatherApiEndpoint + reverseGeoCodeAPIPath;
  static String get weatherBaseURL => openWeatherApiEndpoint + geoCodeAPIPath;
  static String get forecastBaseURL => openWeatherApiEndpoint + forecastAPIPath;
  static String iconURL(String iconName) => iconBaseURL.replaceFirst("[iconName]", iconName);
}