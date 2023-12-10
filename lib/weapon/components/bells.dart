import 'dart:async';

import 'package:flame/components.dart';
import 'package:jam_game/game/components/hero.dart';
import 'package:jam_game/weapon/components/bullet.dart';
import 'package:jam_game/weapon/components/weapon.dart';

class BellsWeapon extends Weapon {
  @override
  final double timer = 2;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    bullet = await game.loadSprite('jingle_bell.png');
  }

  @override
  List<BulletComponent> createBullet(Vector2 direction) {
    return [
      BulletComponent(
        direction: Vector2(0.5, 0.5),
        speed: 200,
        limits: Vector4(0, 0, game.size.x, game.size.y),
        isHero: parent is HeroComponent,
        sprite: bullet,
        size: Vector2.all(24),
        position: absolutePosition,
      ),
      BulletComponent(
        direction: Vector2(0.5, -0.5),
        speed: 200,
        limits: Vector4(0, 0, game.size.x, game.size.y),
        isHero: parent is HeroComponent,
        sprite: bullet,
        size: Vector2.all(24),
        position: absolutePosition,
      ),
      BulletComponent(
        direction: Vector2(-0.5, -0.5),
        speed: 200,
        limits: Vector4(0, 0, game.size.x, game.size.y),
        isHero: parent is HeroComponent,
        sprite: bullet,
        size: Vector2.all(24),
        position: absolutePosition,
      ),
      BulletComponent(
        direction: Vector2(-0.5, 0.5),
        speed: 200,
        limits: Vector4(0, 0, game.size.x, game.size.y),
        isHero: parent is HeroComponent,
        sprite: bullet,
        size: Vector2.all(24),
        position: absolutePosition,
      )
    ];
  }
}
