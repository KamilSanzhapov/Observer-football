import 'database.dart';

class FavLeagueDTO {
  int id;
  String name;
  String logo;
  String season;
  int countryId;

  FavLeagueDTO({this.id, this.name, this.logo, this.season, this.countryId});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map[DBProvider.ID] = id;
    map[DBProvider.FAV_LEAGUE_NAME] = name;
    map[DBProvider.FAV_LEAGUE_LOGO] = logo;
    map[DBProvider.FAV_LEAGUE_SEASON] = season;
    map[DBProvider.FAV_COUNTRY_ID] = countryId;
    return map;
  }

  static FavLeagueDTO fromMap(Map<String, dynamic> map) {
    return FavLeagueDTO(
        id: map[DBProvider.ID],
        name: map[DBProvider.FAV_LEAGUE_NAME],
        logo: map[DBProvider.FAV_LEAGUE_LOGO],
        season: map[DBProvider.FAV_LEAGUE_SEASON],
        countryId: map[DBProvider.FAV_COUNTRY_ID]);
  }
}
