import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_explorer/constants.dart';
import 'package:football_explorer/domain/cubit/fav_league_cubit.dart';
import 'package:football_explorer/domain/cubit/league_cubit.dart';
import 'package:football_explorer/domain/models/country.dart';
import 'package:football_explorer/domain/models/league.dart';
import 'package:football_explorer/main.dart';
import 'package:football_explorer/ui/widgets/app_bar.dart';
import 'package:football_explorer/ui/widgets/favorite_star.dart';
import 'package:football_explorer/ui/widgets/list_states.dart';
import 'package:football_explorer/ui/widgets/list_tile.dart';
import 'package:football_explorer/ui/widgets/pull_to_refresh.dart';


class LeaguesList extends StatefulWidget {
  final Country country;

  LeaguesList({this.country});

  @override
  _LeaguesListState createState() => _LeaguesListState();
}

class _LeaguesListState extends State<LeaguesList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LeagueCubit>(
      create: (context) => LeagueCubit(),
      child: Scaffold(
        appBar: getAppBar(context,
          widget.country.name,
          icon: Image.network(
            widget.country.logo,
            width: 32,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10, left: 16, right: 16),
          child: PullToRefresh(
            child: _LeagueListView(),
            onRefresh: (ctx) async {
              final LeagueCubit leagueCubit = ctx.bloc<LeagueCubit>();
              await leagueCubit.fetchLeagues(widget.country.id.toString());
            },
          ),
        ),
      ),
    );
  }
}

class _LeagueListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeagueCubit, LeagueState>(builder: (context, state) {
      return _generateBody(state, context);
    });
  }

  Widget _generateBody(LeagueState state, BuildContext ctx) {
    switch (state.runtimeType) {
      case LeagueLoadingState:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LeagueErrorState:
        return ErrorStateList(FETCH_ERROR_LEAGUE_LIST);
      case LeagueLoadedState:
        return _generateList((state as LeagueLoadedState).loadedLeagues);
      case LeagueEmptyState:
      default:
        return NoDataStateList();
    }
  }

  Widget _generateList(List<League> leagues) {
    return BlocProvider<FavLeagueCubit>(
        create: (context) => FavLeagueCubit(),
        child: ListView.builder(
          itemCount: leagues.length,
          itemBuilder: (context, index) {
            League league = leagues[index];
            return BlocBuilder<FavLeagueCubit, FavLeagueState>(
                builder: (context, favState) {
              bool isPressed = league.isFavorite;
              if (favState is AddFavLeague && favState.id == league.leagueId)
                isPressed = true;
              else if (favState is RemoveFavLeague && favState.id == league.leagueId)
                isPressed = false;
              return Tile(
                text: league.leagueName,
                logoUrl: league.leagueLogo,
                onTap: () {
                  Navigator.pushNamed(context, ROUTE_LEAGUE_DETAIL,
                      arguments: 1);
                },
                subtitle: league.leagueSeason,
                trailing: FavoriteStar(
                  isPressed: isPressed,
                  onSwitch: (isPressed) async {
                    final FavLeagueCubit favLeagueCubit =
                        context.bloc<FavLeagueCubit>();
                    if (isPressed)
                      await favLeagueCubit.insertFavLeague(league);
                    else
                      await favLeagueCubit.deleteFavLeague(league.leagueId);
                  },
                ),
              );
            });
          },
        ));
  }
}
