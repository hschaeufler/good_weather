
import 'package:json_annotation/json_annotation.dart';

import 'location_dto.dart';

part 'bounds_dto.g.dart';

@JsonSerializable()
class BoundsDTO {
  BoundsDTO({
    required this.northeast,
    required this.southwest,
  });

  LocationDTO northeast;
  LocationDTO southwest;

  factory BoundsDTO.fromJson(Map<String, dynamic> json) => _$BoundsDTOFromJson(json);
  Map<String, dynamic> toJson() => _$BoundsDTOToJson(this);
}