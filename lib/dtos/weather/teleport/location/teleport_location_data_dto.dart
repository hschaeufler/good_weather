import 'package:json_annotation/json_annotation.dart';

import 'coordinates_dto.dart';
import 'embedded_dto.dart';


part 'teleport_location_data_dto.g.dart';

@JsonSerializable()
class TeleportLocationDataDTO {
  TeleportLocationDataDTO({
    required this.embedded,
    required this.coordinates,
  });

  EmbeddedDTO embedded;
  CoordinatesDTO coordinates;

  factory TeleportLocationDataDTO.fromJson(Map<String, dynamic> json) => _$TeleportLocationDataDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TeleportLocationDataDTOToJson(this);
}
