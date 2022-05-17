import 'dart:convert';
import 'package:good_weather/dtos/weather/forecast/weather_data_dto.dart';
import '../utils/environment.dart';
import 'package:http/http.dart' as http;

class WeatherAPIClient {

  static Future<WeatherDataDTO> getWeatherForecast(double longitude, double latitude,{units = "metric", lang = "de"}) async {
    final serviceURI = Uri.https(Environment.apiEndpoint, Environment.forecastAPIPath, {
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


}