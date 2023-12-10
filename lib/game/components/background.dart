import 'package:flame/components.dart';
import 'package:jam_game/game/game.dart';

class Background extends SpriteComponent with HasGameRef<NewGame> {
  Background({super.sprite, super.priority});
  @override
  Future<void> onLoad() async {
    await super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    scale = Vector2(game.size.x / size.x, game.size.y / size.y);
  }
}
