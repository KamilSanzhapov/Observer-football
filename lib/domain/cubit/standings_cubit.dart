import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StandingsCubit extends Cubit<StandingsState> {
  StandingsCubit() : super(StandingsLoadingState());

/* Future<void> fetchStandingss(String countryId, {List<Standings> cacheStandingss}) async {
    try {
      // emit(StandingsLoadingState());
      final List<Standing> _loadedStandingsList =
          await StandingsRepository.getStandingss(countryId, cacheStandingss: cacheStandingss);
      if (_loadedStandingsList.isEmpty)
        emit(StandingsEmptyState());
      else
        emit(StandingsLoadedState(loadedStandingss: _loadedStandingsList));
    } catch (_) {
      emit(StandingsErrorState());
    }
  }*/
}

abstract class StandingsState {}

class StandingsEmptyState extends StandingsState {}

class StandingsLoadingState extends StandingsState {}

class StandingsLoadedState extends StandingsState {
  List<dynamic> loadedStandingss;

  StandingsLoadedState({@required this.loadedStandingss})
      : assert(loadedStandingss != null);
}

class StandingsErrorState extends StandingsState {}
