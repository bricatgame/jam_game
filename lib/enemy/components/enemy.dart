import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:jam_game/enemy/i_enemy.dart';
import 'package:jam_game/game/components/hero.dart';

import 'package:jam_game/game/game.dart';
import 'package:jam_game/weapon/components/weapon.dart';

class EnemyComponent extends PositionComponent
    with HasGameReference<NewGame>, CollisionCallbacks
    implements IEnemy {
  static const enemySpeed = 100;
  final List<Weapon> weapons;

  bool destroyed = false;

  EnemyComponent(double x, double y, this.weapons)
      : super(position: Vector2(x, y), size: Vector2.all(25)) {
    addAll(weapons);
    add(RectangleHitbox());
  }

  @override
  bool get debugMode => true;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // sprite = await game.loadSprite('flutter.png');
  }

  @override
  void update(double dt) {
    super.update(dt);

    moving(dt, game.firstChild<HeroComponent>()!.position);

    if (destroyed) {
      removeFromParent();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is HeroComponent) {
      takeDamage();
    }
  }

  @override
  Future<void> makeAttack() async {}

  @override
  Future<void> moving(double dt, Vector2 vector2) async {
    final directionX = vector2.x - position.x;
    final directionY = vector2.y - position.y;

    final length = sqrt(directionX * directionX + directionY * directionY);

    final directionXNormalized = directionX / length;
    final directionYNormalized = directionY / length;

    x += directionXNormalized * enemySpeed * dt;
    y += directionYNormalized * enemySpeed * dt;
  }

  @override
  Future<void> takeDamage() async {
    destroyed = true;
  }
}
