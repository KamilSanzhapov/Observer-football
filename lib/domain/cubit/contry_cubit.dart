import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_explorer/data/repo/country_repository.dart';
import 'package:football_explorer/data/repo/league_repository.dart';
import 'package:football_explorer/domain/models/country.dart';
import 'package:football_explorer/domain/models/league.dart';


class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryLoadingState());

  Future<void> fetchCountries() async {
    try {
      final List<Country> _loadedCountryList =
          await CountryRepository.getCountries();
      final List<League> _loadedFavLeagues =
          await LeagueRepository.getAllFavLeagues();
      if (_loadedCountryList.isEmpty && _loadedFavLeagues.isEmpty)
        emit(CountryEmptyState());
      else
        emit(CountryLoadedState(
            loadedCountries: _loadedCountryList,
            favLeagues: _loadedFavLeagues));
    } catch (_) {
      emit(CountryErrorState());
    }
  }
}

abstract class CountryState {}

class CountryEmptyState extends CountryState {}

class CountryLoadingState extends CountryState {}

class CountryLoadedState extends CountryState {
  List<dynamic> favLeagues;
  List<dynamic> loadedCountries;

  CountryLoadedState(
      {@required this.loadedCountries, @required this.favLeagues});
}

class CountryErrorState extends CountryState {}
