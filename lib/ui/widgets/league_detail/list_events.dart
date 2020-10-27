import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_explorer/constants.dart';
import 'package:football_explorer/domain/cubit/events_cubit.dart';
import 'package:football_explorer/domain/models/event.dart';
import 'package:football_explorer/domain/models/league.dart';
import 'package:football_explorer/ui/widgets/list_states.dart';
import 'package:football_explorer/ui/widgets/list_tile.dart';

class EventListView extends StatelessWidget {
  final League league;

  EventListView({this.league});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventsCubit>(
      create: (context) => EventsCubit(),
      child: BlocBuilder<EventsCubit, EventsState>(
        builder: (context, state) {
          return _generateBody(state, context);
        },
      ),
    );
  }

  Widget _generateBody(EventsState state, BuildContext ctx) {
    if (state is EventLoadingState) {
      return LoadingStateList();
    } else if (state is EventErrorState) {
      return ErrorStateList(FETCH_ERROR_EVENT_LIST);
    } else if (state is EventLoadedState) {
      return _generateList(state.loadedEvents);
    }
    return NoDataStateList();
  }

  Widget _generateList(List<Event> events) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        Event event = events[index];
        return Tile(
          text: event.team1,
          onTap: () async {},
        );
      },
    );
  }
}
