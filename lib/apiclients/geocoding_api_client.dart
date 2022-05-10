import 'dart:convert';

import 'package:good_weather/dtos/geocoding/city_dto.dart';
import 'package:good_weather/utils/environment.dart';
import 'package:http/http.dart' as http;


class GeocodingAPIClient {

  static Future<List<CityDTO>> getCityCoordinates(String cityName,{limit = 5, lang = "de"}) async {
    final serviceURI = Uri.https(Environment.apiEndpoint, Environment.geoCodeAPIPath, {
      'appid':  Environment.apiToken,
      'q': cityName,
      'limit': limit.toString(),
      'lang': lang,
    });
    final response = await http.get(serviceURI);
    if(response.statusCode == 200) {
      final List jsonList = jsonDecode(response.body);
      List<CityDTO> cityList = List<CityDTO>.from(jsonList.map((e) => CityDTO.fromJson(e)));
      return cityList;
    } else {
      throw Exception("Webservice-Fault " + response.body);
    }

  }
}