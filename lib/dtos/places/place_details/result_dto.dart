
import 'package:json_annotation/json_annotation.dart';

import 'photo_dto.dart';

part 'result_dto.g.dart';

@JsonSerializable()
class ResultDTO {
  ResultDTO({
    required this.photos,
  });

  List<PhotoDTO> photos;

  factory ResultDTO.fromJson(Map<String, dynamic> json) => _$ResultDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ResultDTOToJson(this);
}
