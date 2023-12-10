import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:jam_game/enemy/i_enemy.dart';
import 'package:jam_game/game/components/hero.dart';

import 'package:jam_game/game/game.dart';
import 'package:jam_game/weapon/components/weapon.dart';

class EnemyComponent extends PositionComponent
    with HasGameReference<NewGame>, CollisionCallbacks
    implements IEnemy {
  static const enemySpeed = 50;
  int enemyHealth;
  final List<Weapon> weapons;

  bool destroyed = false;

  late AudioPool pool;

  EnemyComponent(
    double x,
    double y, {
    required this.weapons,
    this.enemyHealth = 1,
  }) : super(position: Vector2(x, y), size: Vector2.all(25)) {
    addAll(weapons);
    add(RectangleHitbox());
  }

  @override
  bool get debugMode => true;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    pool = await FlameAudio.createPool(
      'monster-death-grunt-131480.mp3',
      maxPlayers: 4,
    );

    // sprite = await game.loadSprite('flutter.png');
  }

  @override
  void update(double dt) {
    super.update(dt);

    moving(dt, game.firstChild<HeroComponent>()?.position ?? Vector2(0, 0));

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
    if (other is EnemyComponent) {
      x -= 0.5;
      y += 0.5;
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
    enemyHealth--;
    if (enemyHealth == 0) {
      pool.start();

      destroyed = true;
    }
  }
}
