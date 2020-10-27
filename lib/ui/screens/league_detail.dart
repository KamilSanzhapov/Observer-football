import 'package:flutter/material.dart';
import 'package:football_explorer/domain/models/league.dart';
import 'package:football_explorer/ui/widgets/app_bar.dart';
import 'package:football_explorer/ui/widgets/favorite_star.dart';
import 'package:football_explorer/ui/widgets/league_detail/list_events.dart';
import 'package:football_explorer/ui/widgets/league_detail/standings.dart';

class LeagueDetailList extends StatefulWidget {
  final League league;

  LeagueDetailList({this.league});

  @override
  _LeagueDetailListState createState() => _LeagueDetailListState();
}

class _LeagueDetailListState extends State<LeagueDetailList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBAr(),
        body: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: TabBarView(
            children: [
              EventListView(league: widget.league),
              Standings(league: widget.league),
              EventListView(league: widget.league),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBAr() {
    return getAppBar(
      context,
      widget.league.leagueName,
      icon: Image.network(
        widget.league.leagueLogo,
        width: 32,
      ),
      actions: [
        FavoriteStar(
          league: widget.league,
          isPressed: widget.league.isFavorite,
          onSwitch: (isPressed) async {},
        )
      ],
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.sports_soccer), text: "SCHEDULE"),
          Tab(icon: Icon(Icons.table_rows_outlined), text: "STANDINGS"),
          Tab(icon: Icon(Icons.online_prediction_sharp), text: "PREDICTIONS"),
        ],
      ),
    );
  }
}
