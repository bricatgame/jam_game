import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:jam_game/enemy/components/enemy.dart';
import 'package:jam_game/game/components/hero.dart';
import 'package:jam_game/game/game.dart';
import 'package:jam_game/weapon/i_bullet.dart';

class BulletComponent extends PositionComponent
    with HasGameReference<NewGame>, CollisionCallbacks
    implements IBullet {
  final double speed;
  final Vector2 direction;
  final Vector4 limits;
  final bool isHero;

  var damage;

  BulletComponent({
    required this.direction,
    required this.speed,
    required this.isHero,
    required this.limits,
    super.size,
    super.position,
  }) {
    add(RectangleHitbox());
  }

  @override
  bool get debugMode => true;

  @override
  void update(double dt) {
    super.update(dt);

    position += direction * speed * dt;

    if (position.x <= limits.x ||
        position.y <= limits.y ||
        position.x >= limits.z ||
        position.y >= limits.w) {
      removeFromParent();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is HeroComponent && !isHero) {
      other.takeDamage(1);
      removeFromParent();
    }

    if (other is EnemyComponent && isHero) {
      other.takeDamage();
      removeFromParent();
    }
  }
}
