import 'package:flame/components.dart';
import 'package:jam_game/weapon/components/bullet.dart';

abstract class IWeapon {
  void attack();
  List<BulletComponent> createBullet(Vector2 direction);
}
