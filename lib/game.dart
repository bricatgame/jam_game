import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jam_game/game/game.dart';
import 'package:jam_game/player/bloc/player_bloc.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<PlayerBloc>(create: (_) => PlayerBloc()),
        ],
        child: const GameView(),
      ),
    );
  }
}

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const Positioned.fill(child: Game()),
        Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.select((PlayerBloc bloc) => bloc.state.name),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  context
                      .read<PlayerBloc>()
                      .add(const ChangeName(newName: 'Loading...'));
                },
                child: const Text(
                  'START GAME!!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: NewGame(
        playerBloc: context.read<PlayerBloc>(),
      ),
    );
  }
}
