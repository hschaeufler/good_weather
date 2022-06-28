import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dtos/weather/current/weather_data_dto.dart';
import '../dtos/weather/forecast/one_call_weather_data_dto.dart';
import '../utils/environment.dart';

class WeatherAPIClient {

  static Future<WeatherDataDTO> getCurrentWeather(double longitude, double latitude,{units = "metric", lang = "de"}) async {
    final serviceURI = Uri.https(Environment.openWeatherApiEndpoint, Environment.weatherAPIPath, {
      'appid':  Environment.openWeatherApiToken,
      'lon': longitude.toString(),
      'lat' : latitude.toString(),
      'units': units,
      'lang' : lang,
    });
    final response = await http.get(serviceURI);
    if(response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      WeatherDataDTO weather = WeatherDataDTO.fromJson(json);
      return weather;
    } else {
      throw Exception("Webservice-Fault " + response.body);
    }
  }

  static Future<OneCallWeatherDataDTO> getOneCallWeatherData(double longitude, double latitude,{units = "metric", lang = "de"}) async {
    final serviceURI = Uri.https(Environment.openWeatherApiEndpoint, Environment.forecastAPIPath, {
      'appid':  Environment.openWeatherApiToken,
      'lon': longitude.toString(),
      'lat' : latitude.toString(),
      'units': units,
      'lang' : lang,
    });
    final response = await http.get(serviceURI);
    if(response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      OneCallWeatherDataDTO weather = OneCallWeatherDataDTO.fromJson(json);
      return weather;
    } else {
      throw Exception("Webservice-Fault " + response.body);
    }
  }

}