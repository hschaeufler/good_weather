import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get envFileName => "assets/env/" + (kReleaseMode ? "prod.env" : "dev.env");
  static String get apiToken => dotenv.env['API_TOKEN'] ?? '';
  static String get apiEndpoint => dotenv.env['API_ENDPOINT'] ?? '';
  static String get geoCodeAPIPath => dotenv.env['GEOCODE_API_PATH'] ?? '';
  static String get reverseGeoCodeAPIPath => dotenv.env['REVERSE_GEO_API_PATH'] ?? '';
  static String get weatherAPIPath => dotenv.env['WEATHER_API_PATH'] ?? '';
  static String get iconBaseURL => dotenv.env['ICON_SERVICE_URL'] ?? '';
  static String get geoCodeBaseURL => apiEndpoint + geoCodeAPIPath;
  static String get reverseGeoCodeBaseURL => apiEndpoint + reverseGeoCodeAPIPath;
  static String get weatherBaseURL => apiEndpoint + geoCodeAPIPath;
  static String iconURL(String iconName) => iconBaseURL.replaceFirst("[iconName]", iconName);
}