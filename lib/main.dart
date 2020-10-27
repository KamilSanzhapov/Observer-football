import 'package:flutter/material.dart';
import 'package:football_explorer/domain/models/country.dart';
import 'package:football_explorer/ui/screens/list_event.dart';
import 'package:football_explorer/ui/screens/list_countries.dart';
import 'package:football_explorer/ui/screens/list_leagues.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const String ROUTE_LIST_COUNTRIES = "list_countries";
const String ROUTE_LIST_LEAGUES = "list_leagues";
const String ROUTE_LIST_EVENTS = "list_events";

void main() {
  runApp(
    RefreshConfiguration(
      headerBuilder: () => WaterDropMaterialHeader(
        backgroundColor: Colors.black87,
      ),
      footerTriggerDistance: 60.0,
      enableLoadingWhenFailed: true,
      child: MaterialApp(
        theme: ThemeData(
            textTheme: TextTheme(
              headline2: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w800),
              bodyText1: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
              bodyText2: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 21),
              subtitle1: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
            ),
            accentColor: Colors.black87,
            appBarTheme: AppBarTheme(color: Colors.black87)),
        home: CountryList(),
        onGenerateRoute: (settings) {
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
              return MaterialPageRoute(builder: (context) => EventList());
              break;
          }
          return MaterialPageRoute(builder: (context) => CountryList());
        },
      ),
    ),
  );
}
