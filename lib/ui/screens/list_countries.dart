import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_explorer/constants.dart';
import 'package:football_explorer/data/database/database.dart';
import 'package:football_explorer/domain/cubit/contry_cubit.dart';
import 'package:football_explorer/domain/models/country.dart';
import 'package:football_explorer/domain/models/league.dart';
import 'package:football_explorer/main.dart';
import 'package:football_explorer/ui/widgets/app_bar.dart';
import 'package:football_explorer/ui/widgets/favorite_star.dart';
import 'package:football_explorer/ui/widgets/list_states.dart';
import 'package:football_explorer/ui/widgets/list_tile.dart';
import 'package:football_explorer/ui/widgets/pull_to_refresh.dart';

class CountryList extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  @override
  void initState() {
    super.initState();
    DBProvider.db.init().then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryCubit>(
      create: (context) => CountryCubit(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
        appBar: getAppBar(context, APP_BAR_COUNTRY_LIST, actions: [
          //SwitchTheme(),
        ]),
        body: PullToRefresh(
          child: CountryListView(),
          onRefresh: (ctx) async {
            final CountryCubit countryCubit = ctx.bloc<CountryCubit>();
            await countryCubit.fetchCountries();
          },
        ),
      ),
    );
  }
}

class CountryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryState>(builder: (context, state) {
      return _generateBody(state, context);
    });
  }

  Widget _generateBody(CountryState state, BuildContext ctx) {
    if (state is CountryLoadingState) return LoadingStateList();
    if (state is CountryErrorState)
      return ErrorStateList(FETCH_ERROR_COUNTRY_LIST);
    if (state is CountryLoadedState) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: _generateList(state.loadedCountries, state.favLeagues),
      );
    }
    return NoDataStateList();
  }

  ListView _generateList(
      List<Country> loadedCountries, List<League> favLeagues) {
    List<ListItem> items = collectShowList(loadedCountries, favLeagues);
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        ListItem item = items[index];
        if (item is HeadingItem) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              item.heading,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w800),
            ),
          );
        } else if (item is FavLeagueItem) {
          League league = item.league;
          return Tile(
            text: league.leagueName,
            logoUrl: league.leagueLogo,
            onTap: () {
              Navigator.pushNamed(context, ROUTE_LIST_EVENTS, arguments: 1);
            },
            trailing: FavoriteStar(
              league: league,
              isPressed: league.isFavorite,
              onSwitch: (isPressed) async {
                final CountryCubit countryCubit = context.bloc<CountryCubit>();
                await countryCubit.fetchFavLeague(loadedCountries);
              },
            ),
          );
        } else if (item is CountryItem) {
          Country country = item.country;
          return Tile(
            text: country.name,
            logoUrl: country.logo,
            onTap: () async {
              await Navigator.pushNamed(context, ROUTE_LIST_LEAGUES,
                  arguments: country);
              final CountryCubit countryCubit = context.bloc<CountryCubit>();
              await countryCubit.fetchFavLeague(loadedCountries);
            },
          );
        }
        return Container();
      },
    );
  }

  List<ListItem> collectShowList(
      List<Country> countries, List<League> favLeagues) {
    List<ListItem> list = [];
    if (favLeagues.isNotEmpty) {
      list.add(HeadingItem(heading: FAVORITE_LEAGUES_HEADING));
      list.addAll(favLeagues.map((favLeague) {
        return FavLeagueItem(league: favLeague);
      }).toList());
    }
    if (countries.isNotEmpty) {
      list.add(HeadingItem(heading: MORE_LEAGUES_HEADING));
      list.addAll(countries.map((country) {
        return CountryItem(country: country);
      }).toList());
    }
    return list;
  }
}

abstract class ListItem {}

class FavLeagueItem extends ListItem {
  League league;

  FavLeagueItem({this.league});
}

class CountryItem extends ListItem {
  Country country;

  CountryItem({this.country});
}

class HeadingItem extends ListItem {
  String heading;

  HeadingItem({this.heading});
}
