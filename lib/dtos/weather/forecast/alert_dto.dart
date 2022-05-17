import 'package:json_annotation/json_annotation.dart';

part 'alert_dto.g.dart';

@JsonSerializable()
class AlertDTO {
  final String sender_name;
  final String event;
  final int start;
  final int end;
  final String description;
  final List<String> tags;

  AlertDTO(
      {required this.sender_name,
      required this.event,
      required this.start,
      required this.end,
      required this.description,
      required this.tags});

  factory AlertDTO.fromJson(Map<String, dynamic> json) =>
      _$AlertDTOFromJson(json);
  Map<String, dynamic> toJson() => _$AlertDTOToJson(this);
}
