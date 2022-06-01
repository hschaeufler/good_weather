import 'dart:convert';

import '../dtos/weather/teleport/location/teleport_location_data_dto.dart';
import '../utils/environment.dart';

class TeleportApiClient {
  static Future<TeleportLocationDataDTO> getLocation(double longitude, double latitude,{units = "metric", lang = "de"}) async {
    final serviceURI = Uri.https(Environment.teleportApiEndpoint, Environment.forecastAPIPath, {
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