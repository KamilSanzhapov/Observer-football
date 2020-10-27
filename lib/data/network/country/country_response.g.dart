// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryResponse _$CountryResponseFromJson(Map<String, dynamic> json) {
  return CountryResponse(
    country_id: json['country_id'] as String,
    country_name: json['country_name'] as String,
    country_logo: json['country_logo'] as String,
  );
}

Map<String, dynamic> _$CountryResponseToJson(CountryResponse instance) =>
    <String, dynamic>{
      'country_id': instance.country_id,
      'country_name': instance.country_name,
      'country_logo': instance.country_logo,
    };
