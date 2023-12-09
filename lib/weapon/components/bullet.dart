import 'package:flame/components.dart';
import 'package:jam_game/game/game.dart';
import 'package:jam_game/weapon/i_bullet.dart';

class BulletComponent extends PositionComponent
    with HasGameReference<NewGame>
    implements IBullet {
  final double speed;
  final Vector2 direction;

  BulletComponent({
    required this.direction,
    required this.speed,
    super.position,
  }) : super(size: Vector2.all(10));
  @override
  bool get debugMode => true;

  @override
  void update(double dt) {
    super.update(dt);

    position += direction * speed * dt;
  }
}
