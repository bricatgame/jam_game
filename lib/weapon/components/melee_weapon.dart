import 'dart:async';

import 'package:flame/components.dart';
import 'package:jam_game/game/components/hero.dart';
import 'package:jam_game/weapon/components/bullet.dart';
import 'package:jam_game/weapon/components/weapon.dart';

class MeleeWeapon extends Weapon {
  @override
  final double timer = 2;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    bullet = await game.loadSprite('snowball.png');
  }

  @override
  List<BulletComponent> createBullet(Vector2 direction) {
    return [
      BulletComponent(
        direction: direction,
        limits: Vector4(
          absolutePosition.x - 20,
          absolutePosition.y - 20,
          absolutePosition.x + 20,
          absolutePosition.y + 20,
        ),
        speed: 150,
        isHero: parent is HeroComponent,
        sprite: bullet,
        size: (parent! as PositionComponent).size + Vector2(4, 4),
        position: absolutePosition,
      ),
    ];
  }
}
