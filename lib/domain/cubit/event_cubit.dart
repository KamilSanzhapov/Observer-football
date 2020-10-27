import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventLoadingState());

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

abstract class EventState {}

class EventEmptyState extends EventState {}

class EventLoadingState extends EventState {}

class EventLoadedState extends EventState {
  List<dynamic> loadedEvents;

  EventLoadedState({@required this.loadedEvents})
      : assert(loadedEvents != null);
}

class EventErrorState extends EventState {}
