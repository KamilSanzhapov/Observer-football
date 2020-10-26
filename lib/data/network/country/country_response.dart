import 'package:json_annotation/json_annotation.dart';

part 'country_response.g.dart';


@JsonSerializable()
class CountryResponse {
  String country_id;
  String country_name;
  String country_logo;

  CountryResponse({
    this.country_id,
    this.country_name,
    this.country_logo,
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryResponseToJson(this);
}
