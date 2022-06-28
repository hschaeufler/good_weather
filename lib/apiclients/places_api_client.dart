import 'dart:convert';


import '../dtos/places/place_details/place_details_data_dto.dart';
import '../dtos/places/place_id/maps_geocode_data_dto.dart';
import '../utils/environment.dart';
import 'package:http/http.dart';

class PlacesApiClient {
  static Future<MapsGeocodeDataDto> getPlaceId(double longitude, double latitude) async {
    final serviceURI = Uri.https(Environment.mapsApiEndpoint, Environment.mapsGecodeApiPath, {
      'latlng' : '$latitude,$longitude',
      'key' : Environment.mapsApiToken,
      'result_type': 'locality'
    });
    print(serviceURI.toString());
    final response = await get(serviceURI);
    print(response.body);
    if(response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      MapsGeocodeDataDto mapsGeocodeDataDto = MapsGeocodeDataDto.fromJson(json);
      return mapsGeocodeDataDto;
    } else {
      throw Exception("Webservice-Fault " + response.body);
    }
  }

  static Future<PlaceDetailsDataDto> getPlaceDetails(String placeId, {fields = 'photo'}) async {
    final serviceURI = Uri.https(Environment.mapsApiEndpoint, Environment.mapsPlaceDetailsApiPath, {
      'place_id' : placeId,
      'key' : Environment.mapsApiToken,
      'fields': fields
    });
    print(serviceURI.toString());
    final response = await get(serviceURI);
    if(response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      PlaceDetailsDataDto placeDetailsDataDto = PlaceDetailsDataDto.fromJson(json);
      return placeDetailsDataDto;
    } else {
      throw Exception("Webservice-Fault " + response.body);
    }
  }

  static String getPlacePhotoURL(String photoReference, {maxwidth = 1200, maxheight = 1200}) {
    final serviceURI = Uri.https(Environment.mapsApiEndpoint, Environment.mapsPhotoApiPath, {
      'photo_reference' : photoReference,
      'key' : Environment.mapsApiToken,
      'maxwidth': maxwidth.toString(),
      'maxheight' : maxheight.toString(),
    });
    return serviceURI.toString();
  }
}