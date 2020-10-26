import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_explorer/data/repo/league_repository.dart';
import 'package:football_explorer/domain/models/league.dart';

class FavLeagueCubit extends Cubit<FavLeagueState> {
  FavLeagueCubit() : super(NoActionFavLeague());

  Future<void> insertFavLeague(League league) async {
    try {
      await LeagueRepository.insertFavLeague(league);
      emit(AddFavLeague(id: league.leagueId));
    } catch (_) {
      emit(RemoveFavLeague(id: league.leagueId));
    }
  }

  Future<void> deleteFavLeague(String leagueId) async {
    try {
      await LeagueRepository.deleteFavLeague(leagueId);
      emit(RemoveFavLeague(id: leagueId));
    } catch (_) {
      emit(AddFavLeague(id: leagueId));
    }
  }
}

abstract class FavLeagueState {}

class AddFavLeague extends FavLeagueState {
  String id;

  AddFavLeague({@required this.id});
}

class RemoveFavLeague extends FavLeagueState {
  String id;

  RemoveFavLeague({@required this.id});
}
class NoActionFavLeague extends FavLeagueState {}
