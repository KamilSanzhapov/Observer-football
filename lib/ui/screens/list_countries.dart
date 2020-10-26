import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_explorer/constants.dart';
import 'package:football_explorer/data/database/database.dart';
import 'package:football_explorer/domain/cubit/contry_cubit.dart';
import 'package:football_explorer/domain/cubit/league_cubit.dart';
import 'package:football_explorer/domain/models/country.dart';
import 'package:football_explorer/main.dart';
import 'package:football_explorer/ui/widgets/app_bar.dart';
import 'package:football_explorer/ui/widgets/list_states.dart';
import 'package:football_explorer/ui/widgets/list_tile.dart';
import 'package:football_explorer/ui/widgets/pull_to_refresh.dart';
import 'package:football_explorer/ui/widgets/switch_theme.dart';

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
          SwitchTheme(),
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

  IconButton _settingBtn(BuildContext context) {
    //AnimationController animationController =
    var isNightTheme = false;
    return IconButton(icon: Icon(Icons.nights_stay_outlined), onPressed: () {});
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
    switch (state.runtimeType) {
      case CountryLoadingState:
        return LoadingStateList();
      case CountryErrorState:
        return ErrorStateList(FETCH_ERROR_COUNTRY_LIST);
      case CountryLoadedState:
        return _generateList((state as CountryLoadedState).loadedCountries);
      case LeagueEmptyState:
      default:
        return NoDataStateList();
    }
  }

  ListView _generateList(List<Country> countries) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        Country country = countries[index];
        return Tile(
          text: country.name,
          logoUrl: country.logo,
          onTap: () {
            Navigator.pushNamed(context, ROUTE_LIST_LEAGUES,
                arguments: country);
          },
        );
      },
    );
  }
}
