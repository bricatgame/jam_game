import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:jam_game/enemy/components/enemy.dart';

class EnemyIcicle extends EnemyComponent {
  EnemyIcicle(super.x, super.y, {required super.weapons})
      : super(
          enemyHealth: 10,
        );
  @override
  bool get debugMode => false;

  @override
  Color get debugColor => Colors.blue;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await game.loadSprite('icicle.png');
    size = Vector2.all(80);
  }
}
