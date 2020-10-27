import 'package:json_annotation/json_annotation.dart';

part 'standings_response.g.dart';
// ignore_for_file: non_constant_identifier_names
@JsonSerializable()
class StandingsResponse {
  String team_id;
  String team_name;
  String overall_league_position;
  String overall_league_payed;
  String overall_league_W;
  String overall_league_D;
  String overall_league_L;
  String overall_league_GF;
  String overall_league_GA;
  String overall_league_PTS;

  StandingsResponse(
      this.team_id,
      this.team_name,
      this.overall_league_position,
      this.overall_league_payed,
      this.overall_league_W,
      this.overall_league_D,
      this.overall_league_L,
      this.overall_league_GF,
      this.overall_league_GA,
      this.overall_league_PTS);


  // factory StandingsResponse.fromJson(Map<String, dynamic> json) =>
  //     _$StandingsResponseFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$StandingsResponseToJson(this);

}
