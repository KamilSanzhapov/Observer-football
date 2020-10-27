import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_explorer/domain/models/country.dart';
import 'package:football_explorer/main.dart';
import 'package:football_explorer/ui/screens/league_detail.dart';
import 'package:football_explorer/ui/screens/list_countries.dart';
import 'package:football_explorer/ui/screens/list_leagues.dart';

MaterialPageRoute getRoutes(RouteSettings settings) {
  switch (settings.name) {
    case ROUTE_LIST_COUNTRIES:
      return MaterialPageRoute(builder: (context) => CountryList());
      break;
    case ROUTE_LIST_LEAGUES:
      Country country = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => LeaguesList(country: country));
      break;
    case ROUTE_LEAGUE_DETAIL:
      return MaterialPageRoute(builder: (context) => LeagueDetail());
      break;
  }
  return MaterialPageRoute(builder: (context) => CountryList());
}
