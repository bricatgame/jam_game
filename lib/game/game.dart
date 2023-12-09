import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:jam_game/enemy/components/enemy_generator.dart';
import 'package:jam_game/game/components/hero.dart';

class NewGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  NewGame();

  static const double heroWidth = 2.0;
  static const double heroHeight = 2.0;
  static final Vector2 heroSize = Vector2(heroWidth, heroHeight);

  @override
  Future<void> onLoad() async {
    final hero = HeroComponent()
      ..size = heroSize
      ..position = Vector2(heroWidth, heroHeight);

    world.add(hero);

    add(EnemyCreator());

    camera.viewfinder.visibleGameSize = Vector2(200, 200);
    camera.viewfinder.position = Vector2(heroWidth * 3.5, heroHeight);
    camera.viewfinder.anchor = Anchor.center;
  }
}
