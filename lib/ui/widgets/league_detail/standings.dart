import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_explorer/domain/cubit/standings_cubit.dart';
import 'package:football_explorer/domain/models/league.dart';

class Standings extends StatelessWidget {
  final League league;

  Standings({this.league});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StandingsCubit>(
      create: (context) => StandingsCubit(),
      child: BlocBuilder<StandingsCubit, StandingsState>(
        builder: (context, state) {
          return _generateBody(state, context);
        },
      ),
    );
  }

  Widget _generateBody(state, BuildContext context) {
    return Container();
  }
}
