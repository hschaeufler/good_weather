import 'package:good_weather/models/city_image_data.dart';

import '../dtos/teleport/urban_area_images/teleport_urban_area_image_data_dto.dart';
import 'i_mapper.dart';

class DtoToCityImageDataMapper
    implements IMapper<TeleportUrbanAreaImageDataDTO, List<CityImageData>> {
  @override
  List<CityImageData> map(TeleportUrbanAreaImageDataDTO source) {
    return source.photos.map((photo) {
      return CityImageData(mobile: photo.image.mobile, web: photo.image.web);
    }).toList();
  }
}
