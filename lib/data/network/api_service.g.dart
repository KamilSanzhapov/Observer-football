// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://apiv2.apifootball.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<CountryResponse>> getCountries({action = "get_countries"}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'action': action};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => CountryResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<LeagueResponse>> getLeagues(countryId,
      {action = "get_leagues"}) async {
    ArgumentError.checkNotNull(countryId, 'countryId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'country_id': countryId,
      r'action': action
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => LeagueResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<LeagueResponse>> getStandings(leagueId,
      {action = "get_standings"}) async {
    ArgumentError.checkNotNull(leagueId, 'leagueId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'league_id': leagueId,
      r'action': action
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => LeagueResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
