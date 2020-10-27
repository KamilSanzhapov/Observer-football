import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_explorer/domain/cubit/league_cubit.dart';
import 'package:football_explorer/domain/models/league.dart';
import 'package:football_explorer/ui/widgets/app_bar.dart';
import 'package:football_explorer/ui/widgets/favorite_star.dart';
import 'package:football_explorer/ui/widgets/pull_to_refresh.dart';

class EventList extends StatefulWidget {
  final League league;

  EventList({this.league});

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LeagueCubit>(
      create: (context) => LeagueCubit(),
      child: Scaffold(
        appBar: getAppBar(context, widget.league.leagueName,
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
            ]),
        body: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: PullToRefresh(
            child: _EventListView(),
            onRefresh: (ctx) async {},
          ),
        ),
      ),
    );
  }
}

class _EventListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
