import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_explorer/app/route/generate_routes.dart';
import 'package:football_explorer/constants.dart';
import 'package:football_explorer/domain/cubit/league_cubit.dart';
import 'package:football_explorer/domain/models/country.dart';
import 'package:football_explorer/domain/models/league.dart';
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
        appBar: getAppBar(
          context,
          widget.country.name,
          icon: Image.network(
            widget.country.logo,
            width: 32,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: PullToRefresh(
            child: _LeagueListView(country: widget.country),
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
  final Country country;

  _LeagueListView({this.country});

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
    return ListView.builder(
      itemCount: leagues.length,
      itemBuilder: (context, index) {
        League league = leagues[index];
        return Tile(
          text: league.leagueName,
          logoUrl: league.leagueLogo,
          onTap: () async {
            await Navigator.pushNamed(context, ROUTE_LEAGUE_DETAIL,
                arguments: league);
            final LeagueCubit leagueCubit = context.bloc<LeagueCubit>();
            await leagueCubit.fetchLeagues(country.id.toString(),
                cacheLeagues: leagues);
          },
          subtitle: league.leagueSeason,
          trailing: FavoriteStar(
            league: league,
            isPressed: league.isFavorite,
            onSwitch: (isPressed) async {
              league.isFavorite = isPressed;
            },
          ),
        );
      },
    );
  }
}
