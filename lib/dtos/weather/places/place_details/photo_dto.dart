
import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDTO {
  PhotoDTO({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  int height;
  @JsonKey(name: 'html_attributions')
  List<String> htmlAttributions;
  @JsonKey(name: 'photo_reference')
  String photoReference;
  int width;

  factory PhotoDTO.fromJson(Map<String, dynamic> json) => _$PhotoDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoDTOToJson(this);
}
