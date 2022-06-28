import 'package:json_annotation/json_annotation.dart';

import 'photo_dto.dart';

part 'teleport_urban_area_image_data_dto.g.dart';

@JsonSerializable()
class TeleportUrbanAreaImageDataDTO {
  TeleportUrbanAreaImageDataDTO({
    required this.photos,
  });

  List<PhotoDTO> photos;

  factory TeleportUrbanAreaImageDataDTO.fromJson(Map<String, dynamic> json) => _$TeleportUrbanAreaImageDataDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TeleportUrbanAreaImageDataDTOToJson(this);
}