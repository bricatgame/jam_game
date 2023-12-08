part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();
}

class ChangeName extends PlayerEvent {
  final String newName;
  const ChangeName({
    required this.newName,
  });

  @override
  List<Object?> get props => [];
}
