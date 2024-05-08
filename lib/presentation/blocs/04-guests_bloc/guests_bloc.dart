import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/entities/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(guests: [
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
        ])) {
    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });

    on<AddGuest>((event, emit) {
      final newGuest =
          Todo(id: uuid.v4(), description: event.name, completedAt: null);
      emit(state.copyWith(guests: [...state.guests, newGuest]));
    });

    on<Toggle>((event, emit) {
      final newGuests = state.guests.map((guest) {
        if (guest.id == event.id) {
          return guest.copyWith(
              completedAt: guest.completedAt == null ? DateTime.now() : null);
        } else {
          return guest;
        }
      }).toList();
      emit(state.copyWith(guests: newGuests));
    });
  }

  void changeFilter(GuestFilter newFilter) {
    add(SetCustomFilterEvent(newFilter));
  }

  void addGuest(String name) {
    add(AddGuest(name));
  }

  void toggle(String id, bool newValue) {
    add(Toggle(id, newValue));
  }
}
