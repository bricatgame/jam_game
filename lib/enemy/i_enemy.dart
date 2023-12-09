import 'package:flame/components.dart';

abstract class IEnemy {
  Future<void> takeDamage();
  Future<void> makeAttack();
  Future<void> moving(Vector2 vector2);
}
