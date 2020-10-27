import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventLoadingState());

  Future<void> fetchEvents(String countryId) async {
    try {
      // emit(EventLoadingState());
      /* final List<Event> _loadedEventList =
          await EventRepository.getEvents(countryId);
      if (_loadedEventList.isEmpty)
        emit(EventEmptyState());
      else
        emit(EventLoadedState(loadedEvents: _loadedEventList));*/
    } catch (_) {
      emit(EventErrorState());
    }
  }
}

abstract class EventsState {}

class EventEmptyState extends EventsState {}

class EventLoadingState extends EventsState {}

class EventLoadedState extends EventsState {
  List<dynamic> loadedEvents;

  EventLoadedState({@required this.loadedEvents})
      : assert(loadedEvents != null);
}

class EventErrorState extends EventsState {}
