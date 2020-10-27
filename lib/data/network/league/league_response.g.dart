// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeagueResponse _$LeagueResponseFromJson(Map<String, dynamic> json) {
  return LeagueResponse(
    country_id: json['country_id'] as String,
    country_name: json['country_name'] as String,
    league_id: json['league_id'] as String,
    league_name: json['league_name'] as String,
    league_season: json['league_season'] as String,
    league_logo: json['league_logo'] as String,
    country_logo: json['country_logo'] as String,
  );
}

Map<String, dynamic> _$LeagueResponseToJson(LeagueResponse instance) =>
    <String, dynamic>{
      'country_id': instance.country_id,
      'country_name': instance.country_name,
      'league_id': instance.league_id,
      'league_name': instance.league_name,
      'league_season': instance.league_season,
      'league_logo': instance.league_logo,
      'country_logo': instance.country_logo,
    };
