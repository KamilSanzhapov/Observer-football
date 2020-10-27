import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:football_explorer/app/route/generate_routes.dart';
import 'package:football_explorer/app/theme/theme_notifier.dart';

import 'package:football_explorer/domain/models/country.dart';
import 'package:football_explorer/ui/screens/list_event.dart';

import 'package:football_explorer/ui/screens/list_countries.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const String ROUTE_LIST_COUNTRIES = "list_countries";
const String ROUTE_LIST_LEAGUES = "list_leagues";
const String ROUTE_LIST_EVENTS = "list_events";

void main() {
  runApp(
    ThemeProvider(
      initTheme: lightTheme,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => WaterDropMaterialHeader(
        backgroundColor: Colors.black87,
      ),
      footerTriggerDistance: 60.0,
      enableLoadingWhenFailed: true,
      child: MaterialApp(
        theme: ThemeProvider.of(context),
        home: CountryList(),
        onGenerateRoute: (settings) => getRoutes(settings),

      ),
    );
  }
}
