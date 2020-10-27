import 'package:football_explorer/data/converters/converter_league.dart';
import 'package:football_explorer/data/database/database.dart';
import 'package:football_explorer/data/database/fav_league_dto.dart';
import 'package:football_explorer/data/network/api_service.dart';
import 'package:football_explorer/domain/models/league.dart';


class LeagueRepository {
  static Future<List<League>> getLeagues(String countryId, {List<League> cacheLeagues}) async {
    var list = [];
    if(cacheLeagues == null){
      final api = ApiService.create();
      list = await api.getLeagues(countryId);
    }else{
      list = cacheLeagues;
    }
    List<String> favIds = await DBProvider.db.getFavIdsByCountryId(int.parse(countryId));
    return fromLeagueResponse(list, favIds);
  }

  static Future<void> insertFavLeague(League league) async {
    FavLeagueDTO favLeagueDTO = toFavLeagueDTO(league);
    await DBProvider.db.insertFavLeague(favLeagueDTO);
  }

  static Future<void> deleteFavLeague(String leagueId) async {
    await DBProvider.db.deleteFavLeague(int.parse(leagueId));
  }

  static Future<List<League>> getAllFavLeagues() async {
    List<FavLeagueDTO> favLeagues = await DBProvider.db.getAllFavLeagues();
    return fromLeaguesDTO(favLeagues);
  }
}
