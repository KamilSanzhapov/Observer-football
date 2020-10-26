import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'file:///C:/projects/flutter_pr/football_explorer/lib/data/repo/league_repository.dart';
import 'package:football_explorer/domain/models/league.dart';

class LeagueCubit extends Cubit<LeagueState> {
  LeagueCubit() : super(LeagueLoadingState());

  Future<void> fetchLeagues(String countryId) async {
    try {
      // emit(LeagueLoadingState());
      final List<League> _loadedLeagueList =
          await LeagueRepository.getLeagues(countryId);
      if (_loadedLeagueList.isEmpty)
        emit(LeagueEmptyState());
      else
        emit(LeagueLoadedState(loadedLeagues: _loadedLeagueList));
    } catch (_) {
      emit(LeagueErrorState());
    }
  }
}

abstract class LeagueState {}

class LeagueEmptyState extends LeagueState {}

class LeagueLoadingState extends LeagueState {}

class LeagueLoadedState extends LeagueState {
  List<dynamic> loadedLeagues;

  LeagueLoadedState({@required this.loadedLeagues})
      : assert(loadedLeagues != null);
}

class LeagueErrorState extends LeagueState {}
