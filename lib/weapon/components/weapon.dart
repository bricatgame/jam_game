import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:jam_game/enemy/components/enemy.dart';
import 'package:jam_game/game/components/hero.dart';
import 'package:jam_game/game/game.dart';
import 'package:jam_game/weapon/components/bullet.dart';
import 'package:jam_game/weapon/i_weapon.dart';

class Weapon extends PositionComponent
    with HasGameReference<NewGame>
    implements IWeapon {
  late Timer attackCreator;

  Weapon() : super(size: Vector2.all(10), position: Vector2(0, 0)) {
    attackCreator = Timer(
      1,
      repeat: true,
      onTick: attack,
    );
  }
  @override
  bool get debugMode => true;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    attackCreator.start();
  }

  @override
  void update(double dt) {
    super.update(dt);

    attackCreator.update(dt);
  }

  @override
  void attack() {
    if (parent is EnemyComponent) {
      final vector2 = game.world.firstChild<HeroComponent>()!.position;
      final directionX = vector2.x - absolutePosition.x;
      final directionY = vector2.y - absolutePosition.y;

      final length = sqrt(directionX * directionX + directionY * directionY);

      final directionXNormalized = directionX / length;
      final directionYNormalized = directionY / length;

      game.world.add(
        BulletComponent(
          absolutePosition.x,
          absolutePosition.y,
          Vector2(directionXNormalized, directionYNormalized),
        ),
      );
    }
  }
}
