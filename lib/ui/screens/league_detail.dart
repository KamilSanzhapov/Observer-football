import 'package:flutter/material.dart';
import 'package:football_explorer/ui/widgets/app_bar.dart';

class LeagueDetail extends StatefulWidget {
  @override
  _LeagueDetailState createState() => _LeagueDetailState();
}

class _LeagueDetailState extends State<LeagueDetail> {
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
