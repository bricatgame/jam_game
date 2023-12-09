import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:jam_game/enemy/components/enemy_generator.dart';
import 'package:jam_game/game/components/hero.dart';

class NewGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  NewGame();

  @override
  Future<void> onLoad() async {
    add(HeroComponent());

    add(EnemyCreator());
  }
}
