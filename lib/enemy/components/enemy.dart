import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:jam_game/enemy/i_enemy.dart';
import 'package:jam_game/game/components/hero.dart';

import 'package:jam_game/game/game.dart';

class EnemyComponent extends SpriteComponent
    with HasGameReference<NewGame>, CollisionCallbacks
    implements IEnemy {
  static const enemySpeed = 1;

  bool destroyed = false;

  EnemyComponent(double x, double y)
      : super(position: Vector2(x, y), size: Vector2.all(25)) {
    add(RectangleHitbox(collisionType: CollisionType.passive));
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await game.loadSprite('enemy.png');
  }

  @override
  void update(double dt) {
    super.update(dt);

    // final centerX = game.size.x / 2.0;
    // final centerY = game.size.y / 2.0;

    // final directionX = centerX - x;
    // final directionY = centerY - y;

    // final length = sqrt(directionX * directionX + directionY * directionY);

    final directionXNormalized =
        game.world.firstChild<HeroComponent>()!.position.x;
    final directionYNormalized =
        game.world.firstChild<HeroComponent>()!.position.y;

    x += directionXNormalized * enemySpeed;
    y += directionYNormalized * enemySpeed;

    if (destroyed) {
      removeFromParent();
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
