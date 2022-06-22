import 'dart:convert';

import 'package:good_weather/dtos/weather/teleport/urban_area_images/teleport_urban_area_image_data_dto.dart';

import '../dtos/weather/teleport/location/teleport_location_data_dto.dart';
import '../utils/environment.dart';
import 'package:http/http.dart';

class TeleportApiClient {
  static Future<TeleportLocationDataDTO> getLocation(double longitude, double latitude) async {
    final serviceURI = Uri.https(Environment.teleportApiEndpoint, '${Environment.teleportLocationsAPIPath}$latitude,$longitude', {
      'embed' : 'location:nearest-urban-areas',
    });
    print(serviceURI.toString());
    final response = await get(serviceURI);
    if(response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> json = jsonDecode(response.body);
      TeleportLocationDataDTO location = TeleportLocationDataDTO.fromJson(json);
      return location;
    } else {
      throw Exception("Webservice-Fault " + response.body);
    }
  }

  static Future<TeleportUrbanAreaImageDataDTO> getUrbanAreaImage(String urbanAreaUrl) async {
    final serviceURI = Uri.parse('$urbanAreaUrl${Environment.teleportImagesSuffix}');
    print(serviceURI.toString());
    final response = await get(serviceURI);
    if(response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      TeleportUrbanAreaImageDataDTO weather = TeleportUrbanAreaImageDataDTO.fromJson(json);
      return weather;
    } else {
      throw Exception("Webservice-Fault " + response.body);
    }
  }
}