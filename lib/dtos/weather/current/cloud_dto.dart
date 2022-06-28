import 'package:json_annotation/json_annotation.dart';

part 'cloud_dto.g.dart';

@JsonSerializable()
class CloudDTO {
  final int all;

  CloudDTO({required this.all});

  factory CloudDTO.fromJson(Map<String, dynamic> json) =>
      _$CloudDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CloudDTOToJson(this);
}
