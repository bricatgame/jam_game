import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:jam_game/game/game.dart';
import 'package:jam_game/weapon/components/weapon.dart';

class HeroComponent extends PositionComponent
    with KeyboardHandler, HasGameRef<NewGame>, CollisionCallbacks {
  static const speed = 100.0;
  int heroHealth = 10;

  HeroComponent() : super() {
    add(RectangleHitbox());
    weapons = []; //Weapon()];
    addAll(weapons);
  }

  Vector2 velocity = Vector2(0, 0);
  Vector2 direction = Vector2(1, 0);
  List<Weapon> weapons = [];

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
      direction.x = -1;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      velocity.x = 1;
      direction.x = 1;
    } else {
      velocity.x = 0;
    }

    if (keysPressed.contains(LogicalKeyboardKey.keyW) ||
        keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      velocity.y = -1;
      direction.y = -1;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyS) ||
        keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      velocity.y = 1;
      direction.y = 1;
    } else {
      velocity.y = 0;
      direction.y = 0;
    }

    return true;
  }

  void move(Vector2 tapCoordinate) {
    final directionPan = (tapCoordinate - absolutePosition).normalized();

    velocity = directionPan;
    direction = directionPan;
  }

  void stopMove() {
    velocity = Vector2(0, 0);
  }

  void takeDamage() {
    heroHealth--;
    //TODO:Uncommit enable death for player.
    //TODO:Implement move to dead screen.
    // if (heroHealth == 0) {
    //   game.pauseEngine();
    // }
  }
}
