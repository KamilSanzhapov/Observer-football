import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_explorer/domain/models/country.dart';
import 'package:football_explorer/domain/models/league.dart';
import 'package:football_explorer/main.dart';
import 'package:football_explorer/ui/screens/list_countries.dart';
import 'package:football_explorer/ui/screens/list_events.dart';
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
    case ROUTE_LIST_EVENTS:
      League league = settings.arguments;
      return MaterialPageRoute(builder: (context) => EventList(league: league));
      break;
  }
  return MaterialPageRoute(builder: (context) => CountryList());
}
