import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:jam_game/game/components/hero.dart';
import 'package:jam_game/player/bloc/player_bloc.dart';

class NewGame extends FlameGame {
  final PlayerBloc playerBloc;

  NewGame({
    required this.playerBloc,
  });

  static const double heroWidth = 500.0;
  static const double heroHeight = 1000.0;
  static final Vector2 heroSize = Vector2(heroWidth, heroHeight);

  @override
  Future<void> onLoad() async {
    final hero = HeroComponent()
      ..size = heroSize
      ..position = Vector2(heroWidth, heroHeight);
    await add(
      FlameMultiBlocProvider(
        providers: [
          FlameBlocProvider<PlayerBloc, PlayerState>.value(
            value: playerBloc,
          ),
        ],
      ),
    );

    world.add(hero);

    camera.viewfinder.visibleGameSize =
        Vector2(heroWidth * 7 * 8, 4 * heroHeight);
    camera.viewfinder.position = Vector2(heroWidth * 3.5, heroHeight);
    camera.viewfinder.anchor = Anchor.topCenter;
  }
}
