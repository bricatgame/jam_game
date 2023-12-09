import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:jam_game/game/game.dart';

class HeroComponent extends PositionComponent
    with KeyboardHandler, HasGameRef<NewGame> {
  static const speed = 200.0;

  Vector2 velocity = Vector2(0, 0);

  @override
  bool get debugMode => true;

  @override
  void render(Canvas canvas) {
    // canvas.drawRect(size.toRect(), _paint);
  }

  @override
  void update(double dt) {
    position += (velocity * speed) * dt;
    velocity *= 0.975;
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    velocity.x += (keysPressed.contains(LogicalKeyboardKey.keyA) ||
            keysPressed.contains(LogicalKeyboardKey.arrowLeft))
        ? -1
        : 0;
    velocity.x += (keysPressed.contains(LogicalKeyboardKey.keyD) ||
            keysPressed.contains(LogicalKeyboardKey.arrowRight))
        ? 1
        : 0;

    velocity.y += (keysPressed.contains(LogicalKeyboardKey.keyW) ||
            keysPressed.contains(LogicalKeyboardKey.arrowUp))
        ? -1
        : 0;
    velocity.y += (keysPressed.contains(LogicalKeyboardKey.keyS) ||
            keysPressed.contains(LogicalKeyboardKey.arrowDown))
        ? 1
        : 0;

    return true;
  }
}
