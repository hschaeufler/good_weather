import 'package:json_annotation/json_annotation.dart';

import 'attribution_dto.dart';
import 'image_dto.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDTO {
  PhotoDTO({
    required this.attribution,
    required this.image,
  });

  final AttributionDTO attribution;
  final ImageDTO image;

  factory PhotoDTO.fromJson(Map<String, dynamic> json) => _$PhotoDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoDTOToJson(this);
}