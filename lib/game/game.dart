import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:jam_game/enemy/components/enemy_generator.dart';
import 'package:jam_game/game/components/hero.dart';

class NewGame extends FlameGame
    with
        HasKeyboardHandlerComponents,
        HasCollisionDetection,
        MouseMovementDetector {
  Vector2 mousePosition = Vector2(0, 0);

  NewGame();

  static const double heroWidth = 25.0;
  static const double heroHeight = 25.0;
  static final Vector2 heroSize = Vector2(heroWidth, heroHeight);

  @override
  Future<void> onLoad() async {
    final hero = HeroComponent()
      ..size = heroSize
      ..position = Vector2(heroWidth, heroHeight);
    add(hero);

    add(EnemyCreator());

    camera.viewfinder.visibleGameSize = Vector2(200, 200);
    camera.viewfinder.position = Vector2(heroWidth * 3.5, heroHeight);
    camera.viewfinder.anchor = Anchor.topLeft;
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    super.onMouseMove(info);
    mousePosition = info.eventPosition.widget;
  }
}
