
import 'package:json_annotation/json_annotation.dart';

part 'image_dto.g.dart';


@JsonSerializable()
class ImageDTO {
  ImageDTO({
    required this.mobile,
    required this.web,
  });

  final String mobile;
  final String web;

  factory ImageDTO.fromJson(Map<String, dynamic> json) => _$ImageDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDTOToJson(this);
}
