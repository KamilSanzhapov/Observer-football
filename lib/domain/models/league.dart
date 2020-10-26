class League {

  String leagueId;
  String leagueName;
  String leagueSeason;
  String leagueLogo;
  String countryId;
  bool isFavorite = false;

  League({
    this.leagueId,
    this.leagueName,
    this.leagueSeason,
    this.leagueLogo,
    this.countryId,
    this.isFavorite  = false
  });
}
