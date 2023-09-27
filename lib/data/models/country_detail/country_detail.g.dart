// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDetail _$CountryDetailFromJson(Map<String, dynamic> json) =>
    CountryDetail(
      name: json['name'] as String? ?? '',
      emoji: json['emoji'] as String? ?? '',
      capital: json['capital'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      native: json['native'] as String? ?? '',
    );

Map<String, dynamic> _$CountryDetailToJson(CountryDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'native': instance.native,
      'capital': instance.capital,
      'currency': instance.currency,
      'emoji': instance.emoji,
    };
