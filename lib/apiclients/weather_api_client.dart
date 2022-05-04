import 'dart:convert';
import 'package:good_weather/dtos/weather/weather_data_dto.dart';

import '../utils/environment.dart';
import 'package:http/http.dart' as http;

class WeatherAPIClient {

  static Future<List<WeatherDataDTO>> getWeather(double longitude, double latitude,{units = "metric", lang = "de"}) async {
    final serviceURI = Uri.https(Environment.apiEndpoint, Environment.weatherAPIPath, {
      'appid':  Environment.apiToken,
      'lon': longitude,
      'lat' : latitude,
    });
    final response = await http.get(serviceURI);
    if(response.statusCode == 200) {
      final List jsonList = jsonDecode(response.body);
      List<WeatherDataDTO> cityList = List<WeatherDataDTO>.from(jsonList.map((e) => WeatherDataDTO.fromJson(e)));
      return cityList;
    } else {
      throw Exception("Webservice-Fault " + response.body);
    }

  }
}