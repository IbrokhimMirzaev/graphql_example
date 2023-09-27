import 'package:json_annotation/json_annotation.dart';

part 'country_detail.g.dart';

@JsonSerializable()
class CountryDetail {
  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "native")
  String native;

  @JsonKey(defaultValue: "", name: "capital")
  String capital;

  @JsonKey(defaultValue: "", name: "currency")
  String currency;

  @JsonKey(defaultValue: "", name: "emoji")
  String emoji;

  CountryDetail({
    required this.name,
    required this.emoji,
    required this.capital,
    required this.currency,
    required this.native,
  });

  factory CountryDetail.fromJson(Map<String, dynamic> json) => _$CountryDetailFromJson(json);
}
