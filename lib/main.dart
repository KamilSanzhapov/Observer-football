import 'package:flutter/material.dart';
import 'package:football_explorer/app/route/generate_routes.dart';
import 'package:football_explorer/app/theme/theme_notifier.dart';
import 'package:football_explorer/ui/screens/list_countries.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const String ROUTE_LIST_COUNTRIES = "list_countries";
const String ROUTE_LIST_LEAGUES = "list_leagues";
const String ROUTE_LIST_EVENTS = "list_events";

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
      return RefreshConfiguration(
        headerBuilder: () => WaterDropMaterialHeader(
          backgroundColor: Colors.black87,
        ),
        footerTriggerDistance: 60.0,
        enableLoadingWhenFailed: true,
        child: MaterialApp(
          theme: notifier.theme,
          home: CountryList(),
          onGenerateRoute: (settings) => getRoutes(settings),
        ),
      );
    });
  }
}
