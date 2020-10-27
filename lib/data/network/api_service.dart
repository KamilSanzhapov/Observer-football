import 'package:dio/dio.dart';
import 'package:football_explorer/constants.dart';
import 'package:football_explorer/data/network/country/country_response.dart';
import 'package:football_explorer/data/network/league/league_response.dart';
import 'package:football_explorer/data/network/standings/standings_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    dio.options.headers = {"Accept": "application/json"};
    dio.options.queryParameters = {"APIkey": API_KEY};
    return ApiService(dio);
  }

  @GET("")
  Future<List<CountryResponse>> getCountries({
    @Query("action") String action = "get_countries",
  });

  @GET("")
  Future<List<LeagueResponse>> getLeagues(
    @Query("country_id") String countryId, {
    @Query("action") String action = "get_leagues",
  });


}
