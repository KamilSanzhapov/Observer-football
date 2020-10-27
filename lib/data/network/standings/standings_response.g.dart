// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandingsResponse _$StandingsResponseFromJson(Map<String, dynamic> json) {
  return StandingsResponse(
    json['team_id'] as String,
    json['team_name'] as String,
    json['overall_league_position'] as String,
    json['overall_league_payed'] as String,
    json['overall_league_W'] as String,
    json['overall_league_D'] as String,
    json['overall_league_L'] as String,
    json['overall_league_GF'] as String,
    json['overall_league_GA'] as String,
    json['overall_league_PTS'] as String,
  );
}

Map<String, dynamic> _$StandingsResponseToJson(StandingsResponse instance) =>
    <String, dynamic>{
      'team_id': instance.team_id,
      'team_name': instance.team_name,
      'overall_league_position': instance.overall_league_position,
      'overall_league_payed': instance.overall_league_payed,
      'overall_league_W': instance.overall_league_W,
      'overall_league_D': instance.overall_league_D,
      'overall_league_L': instance.overall_league_L,
      'overall_league_GF': instance.overall_league_GF,
      'overall_league_GA': instance.overall_league_GA,
      'overall_league_PTS': instance.overall_league_PTS,
    };
