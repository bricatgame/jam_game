part of 'player_bloc.dart';

class PlayerState extends Equatable {
  final String name;

  const PlayerState({
    required this.name,
  });

  const PlayerState.empty()
      : this(
          name: 'Hello flutter flame jam!',
        );

  PlayerState copyWith({
    String? name,
  }) {
    return PlayerState(
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [name];
}
