
import 'package:json_annotation/json_annotation.dart';

part 'plus_code_dto.g.dart';

@JsonSerializable()
class PlusCodeDTO {
  PlusCodeDTO({
    required this.compoundCode,
    required this.globalCode,
  });

  @JsonKey(name: 'compound_code')
  String compoundCode;
  @JsonKey(name: 'global_code')
  String globalCode;

  factory PlusCodeDTO.fromJson(Map<String, dynamic> json) => _$PlusCodeDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PlusCodeDTOToJson(this);
}