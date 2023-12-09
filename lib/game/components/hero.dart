import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:jam_game/game/game.dart';

class HeroComponent extends PositionComponent
    with KeyboardHandler, HasGameRef<NewGame>, CollisionCallbacks {
  static const speed = 200.0;

  HeroComponent() : super() {
    add(RectangleHitbox());
  }

  Vector2 velocity = Vector2(0, 0);

  @override
  bool get debugMode => true;

  @override
  void update(double dt) {
    position += velocity * speed * dt;
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      velocity.x = -1;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      velocity.x = 1;
    } else {
      velocity.x = 0;
    }

    if (keysPressed.contains(LogicalKeyboardKey.keyW) ||
        keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      velocity.y = -1;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyS) ||
        keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      velocity.y = 1;
    } else {
      velocity.y = 0;
    }

    return true;
  }
}
