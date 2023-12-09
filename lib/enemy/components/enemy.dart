import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:jam_game/enemy/i_enemy.dart';
import 'package:jam_game/game/components/hero.dart';

import 'package:jam_game/game/game.dart';

class EnemyComponent extends PositionComponent with HasGameReference<NewGame>, CollisionCallbacks implements IEnemy {
  static const enemySpeed = 100;

  bool destroyed = false;

  EnemyComponent(double x, double y) : super(position: Vector2(x, y), size: Vector2.all(25)) {
    add(RectangleHitbox(collisionType: CollisionType.passive));
  }

  @override
  bool get debugMode => true;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    final directionX = game.world.firstChild<HeroComponent>()!.position.x - position.x;
    final directionY = game.world.firstChild<HeroComponent>()!.position.y - position.y;

    final length = sqrt(directionX * directionX + directionY * directionY);

    final directionXNormalized = directionX / length;
    final directionYNormalized = directionY / length;

    x += directionXNormalized * enemySpeed * dt;
    y += directionYNormalized * enemySpeed * dt;

    if (destroyed) {
      removeFromParent();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is HeroComponent) {
      print('lsadadasdas');
    }
  }

  @override
  Future<void> makeAttack() {
    // TODO: implement makeAttack
    throw UnimplementedError();
  }

  @override
  Future<void> moving(Vector2 vector2) {
    // TODO: implement moving
    throw UnimplementedError();
  }

  @override
  Future<void> takeDamage() async {
    destroyed = true;

    // game.add(ExplosionComponent(x - 25, y - 25));
    // game.increaseScore();
  }
}
