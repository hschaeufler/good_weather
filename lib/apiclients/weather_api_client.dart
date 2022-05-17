import 'dart:convert';
import 'package:good_weather/dtos/weather/currentweather/weather_data_dto.dart';

import '../utils/environment.dart';
import 'package:http/http.dart' as http;

class WeatherAPIClient {

  static Future<WeatherDataDTO> getCurrentWeather(double longitude, double latitude,{units = "metric", lang = "de"}) async {
    final serviceURI = Uri.https(Environment.apiEndpoint, Environment.weatherAPIPath, {
      'appid':  Environment.apiToken,
      'lon': longitude.toString(),
      'lat' : latitude.toString(),
      'units': units,
      'lang' : lang,
    });
    final response = await http.get(serviceURI);
    print(response.body);
    if(response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      WeatherDataDTO weather = WeatherDataDTO.fromJson(json);
      return weather;
    } else {
      throw Exception("Webservice-Fault " + response.body);
    }
  }

  static Future<WeatherDataDTO> getDailyWeatherForecast(double longitude, double latitude,{units = "metric", lang = "de", count = 16}) async {
    final serviceURI = Uri.https(Environment.apiEndpoint, Environment.dailyForecastAPIPath, {
      'appid':  Environment.apiToken,
      'lon': longitude.toString(),
      'lat' : latitude.toString(),
      'units': units,
      'lang' : lang,
      'cnt': count,
    });
    final response = await http.get(serviceURI);
    print(response.body);
    if(response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      WeatherDataDTO weather = WeatherDataDTO.fromJson(json);
      return weather;
    } else {
      throw Exception("Webservice-Fault " + response.body);
    }
  }


}