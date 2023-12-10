import 'package:flutter/material.dart';
import 'package:jam_game/enemy/components/enemy.dart';

class EnemyMammoth extends EnemyComponent {
  EnemyMammoth(super.x, super.y, {required super.weapons})
      : super(
          enemyHealth: 1,
        );
  @override
  bool get debugMode => false;

  @override
  Color get debugColor => Colors.brown;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await game.loadSprite('mammoth.png');
  }
}
