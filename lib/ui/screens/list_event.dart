import 'package:flutter/material.dart';
import 'package:football_explorer/ui/widgets/app_bar.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context,
        "APL",
        icon: Image.network(
          'https://apiv2.apifootball.com/badges/logo_leagues/149_championship.png',
          height: 40,
        ),
      ),
    );
  }
}
