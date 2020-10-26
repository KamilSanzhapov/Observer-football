import 'package:football_explorer/data/database/fav_league_dto.dart';
import 'package:football_explorer/data/network/league/league_response.dart';
import 'package:football_explorer/domain/models/league.dart';

List<League> fromLeagueResponse(
    List<LeagueResponse> leagueRepository, List<String> favIds) {
  if (leagueRepository == null || leagueRepository.isEmpty) return [];
  var list = leagueRepository.map((leagueResponse) {
    return League(
      leagueId: leagueResponse.league_id,
      leagueName: leagueResponse.league_name,
      leagueSeason: leagueResponse.league_season,
      leagueLogo: leagueResponse.league_logo,
      countryId: leagueResponse.country_id,
      isFavorite: favIds.contains(leagueResponse.league_id),
    );
  }).toList();
  return list;
}

FavLeagueDTO toFavLeagueDTO(League league) {
  return FavLeagueDTO(
    id: int.parse(league.leagueId),
    name: league.leagueName,
    logo: league.leagueLogo,
    season: league.leagueSeason,
    countryId: int.parse(league.countryId),
  );
}
List<League> fromLeaguesDTO(List<FavLeagueDTO> leaguesDTO){
  if (leaguesDTO == null || leaguesDTO.isEmpty) return [];
  var list = leaguesDTO.map((leagueDTO) {
    return League(
      leagueId: leagueDTO.id.toString(),
      leagueName: leagueDTO.name,
      leagueSeason: leagueDTO.season,
      leagueLogo: leagueDTO.logo,
      countryId: leagueDTO.countryId.toString(),
      isFavorite: true
    );
  }).toList();
  return list;
}
