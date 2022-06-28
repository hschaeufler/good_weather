
import 'package:json_annotation/json_annotation.dart';

part 'adress_component_dto.g.dart';

@JsonSerializable()
class AddressComponentDTO {
  AddressComponentDTO({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  @JsonKey(name: 'long_name')
  String longName;
  @JsonKey(name: 'short_name')
  String shortName;
  List<String> types;


  factory AddressComponentDTO.fromJson(Map<String, dynamic> json) => _$AddressComponentDTOFromJson(json);
  Map<String, dynamic> toJson() => _$AddressComponentDTOToJson(this);
}