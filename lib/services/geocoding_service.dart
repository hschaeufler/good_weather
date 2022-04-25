import 'dart:convert';

import 'package:good_weather/utils/environment.dart';
import 'package:http/http.dart' as http;

import '../models/city.dart';

class GeocodingService {

  static Future<List<City>> getCityCoordinates(String cityName,{limit = 5}) async {
    final serviceURI = Uri.https(Environment.apiEndpoint, Environment.geoCodeAPIPath, {
      'appid':  Environment.apiToken,
      'q': cityName,
      'limit': limit.toString(),
    });
    final response = await http.get(serviceURI);
    if(response.statusCode == 200) {
      final List jsonList = jsonDecode(response.body);
      List<City> cityList = List<City>.from(jsonList.map((e) => City.fromJson(e)));
      return cityList;
    } else {
      throw Exception("Webservice-Fault " + response.body);
    }

  }
}