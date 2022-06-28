import 'package:good_weather/apiclients/teleport_api_client.dart';
import 'package:good_weather/mapper/dto_to_city_image_data_mapper.dart';
import 'package:good_weather/models/city_image_data.dart';

import '../dtos/teleport/location/teleport_location_data_dto.dart';
import '../dtos/teleport/urban_area_images/teleport_urban_area_image_data_dto.dart';


class TeleportRepository {

  final _dtoToCityImageDataMapper = DtoToCityImageDataMapper();

  TeleportRepository._();

  static final TeleportRepository _instance = TeleportRepository._();

  factory TeleportRepository() {
    return _instance;
  }

  Future<List<CityImageData>> getImage(double longitude, double latitude) async {
    final TeleportLocationDataDTO locationDataDTO = await TeleportApiClient.getLocation(longitude, latitude);
    final String urbanAreaURL = locationDataDTO.embedded.locationNearestUrbanAreas[0].links.locationNearestUrbanArea.href;
    if(urbanAreaURL == null) {
      return Future.error("No Urban Area Found for Coordinates");
    }
    final TeleportUrbanAreaImageDataDTO urbanAreaImageDataDTO = await TeleportApiClient.getUrbanAreaImage(urbanAreaURL);
    return _dtoToCityImageDataMapper.map(urbanAreaImageDataDTO);
  }

}