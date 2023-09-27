import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  @JsonKey(defaultValue: "", name: "code")
  String code;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "emoji")
  String emoji;

  Country({
    required this.code,
    required this.name,
    required this.emoji,
  });

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
}
