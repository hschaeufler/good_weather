import 'package:collection/collection.dart';
import 'package:good_weather/apiclients/places_api_client.dart';

import '../dtos/places/place_details/place_details_data_dto.dart';
import '../dtos/places/place_id/maps_geocode_data_dto.dart';

class ImageRepository {

  ImageRepository._();

  static final ImageRepository _instance = ImageRepository._();

  factory ImageRepository() {
    return _instance;
  }

  Future<List<String>> getImage(double longitude, double latitude) async {
    final MapsGeocodeDataDto mapsGeocodeDataDto = await PlacesApiClient.getPlaceId(longitude, latitude);
    final String? placeId = mapsGeocodeDataDto.results.firstOrNull?.placeId;
    if(placeId == null) {
      return [];
    }
    final PlaceDetailsDataDto placeDetailsDataDto = await PlacesApiClient.getPlaceDetails(placeId);
    if(placeDetailsDataDto.result.photos.isEmpty) {
      return [];
    }
    List<String> cityImages = placeDetailsDataDto.result.photos.map((photo) => PlacesApiClient.getPlacePhotoURL(photo.photoReference)).toList();
    return cityImages;
  }

}