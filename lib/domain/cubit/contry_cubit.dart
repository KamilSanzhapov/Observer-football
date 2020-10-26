import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'file:///C:/projects/flutter_pr/football_explorer/lib/data/repo/country_repository.dart';
import 'package:football_explorer/domain/models/country.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryLoadingState());

  Future<void> fetchCountries() async {
    try {
      //emit(CountryLoadingState());
      final List<Country> _loadedCountryList =
          await CountryRepository.getCountries();
      if (_loadedCountryList.isEmpty)
        emit(CountryEmptyState());
      else
        emit(CountryLoadedState(loadedCountries: _loadedCountryList));
    } catch (_) {
      emit(CountryErrorState());
    }
  }
}

abstract class CountryState {}

class CountryEmptyState extends CountryState {}

class CountryLoadingState extends CountryState {}

class CountryLoadedState extends CountryState {
  List<dynamic> loadedCountries;

  CountryLoadedState({@required this.loadedCountries})
      : assert(loadedCountries != null);
}

class CountryErrorState extends CountryState {}
