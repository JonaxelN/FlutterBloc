part of 'guests_bloc.dart';

enum GuestFilter {
  all,
  invited,
  noInvited,
}

class GuestsState extends Equatable {
  final GuestFilter filter;
  final List<Todo> guests;

  const GuestsState({
    this.filter = GuestFilter.all,
    this.guests = const [],
  });

  get howMany => guests.length;

  List<Todo> get filteredGuests {
    switch (filter) {
      case GuestFilter.invited:
        return guests.where((guest) => guest.done).toList();
      case GuestFilter.noInvited:
        return guests.where((guest) => !guest.done).toList();
      default:
        return guests;
    }
  }

  int get howManyFiltered => filteredGuests.length;

  GuestsState copyWith({
    GuestFilter? filter,
    List<Todo>? guests,
  }) {
    return GuestsState(
      filter: filter ?? this.filter,
      guests: guests ?? this.guests,
    );
  }

  @override
  List<Object> get props => [filter, guests];
}
