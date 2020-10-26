import 'package:json_annotation/json_annotation.dart';

part 'league_response.g.dart';

@JsonSerializable()
class LeagueResponse {
  String country_id;
  String country_name;
  String league_id;
  String league_name;
  String league_season;
  String league_logo;
  String country_logo;

  LeagueResponse({
    this.country_id,
    this.country_name,
    this.league_id,
    this.league_name,
    this.league_season,
    this.league_logo,
    this.country_logo,
  });

  factory LeagueResponse.fromJson(Map<String, dynamic> json) =>
      _$LeagueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueResponseToJson(this);
}
