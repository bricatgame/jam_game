import 'package:flutter/material.dart';
import 'package:jam_game/enemy/components/enemy.dart';

class EnemySnowman extends EnemyComponent {
  EnemySnowman(super.x, super.y, {required super.weapons})
      : super(
          enemyHealth: 1,
        );
  @override
  bool get debugMode => true;

  @override
  Color get debugColor => Colors.white;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // sprite = await game.loadSprite('flutter.png');
  }
}
