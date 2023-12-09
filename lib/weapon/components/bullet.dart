import 'package:flame/components.dart';
import 'package:jam_game/game/game.dart';
import 'package:jam_game/weapon/i_bullet.dart';

class BulletComponent extends PositionComponent
    with HasGameReference<NewGame>
    implements IBullet {
  double bulletSpeed = 150;
  final Vector2 direction;

  BulletComponent(
    double x,
    double y,
    this.direction,
  ) : super(size: Vector2.all(10), position: Vector2(x, y));
  @override
  bool get debugMode => true;

  @override
  void update(double dt) {
    super.update(dt);

    position += direction * bulletSpeed * dt;
  }
}
