import 'dart:async';

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
  final double timer = 0.5;

  Weapon() : super(size: Vector2.all(10), position: Vector2(0, 0)) {
    attackCreator = Timer(
      timer,
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
      // Hero always exist, if it dead we need in same time move to dead screen.
      final direction =
          (game.firstChild<HeroComponent>()!.position - absolutePosition)
              .normalized();

      game.addAll(createBullet(direction));
    }

    if (parent is HeroComponent) {
      final direction = (game.mousePosition - absolutePosition).normalized();

      game.addAll(createBullet(direction));
    }
  }

  @override
  List<BulletComponent> createBullet(Vector2 direction) {
    return [
      BulletComponent(
        direction: direction,
        speed: 150,
        limits: Vector4(0, 0, game.size.x, game.size.y),
        isHero: parent is HeroComponent,
        size: Vector2.all(10),
        position: absolutePosition,
      ),
    ];
  }
}
