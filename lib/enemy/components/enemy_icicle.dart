import 'package:flutter/material.dart';
import 'package:jam_game/enemy/components/enemy.dart';

class EnemyIcicle extends EnemyComponent {
  EnemyIcicle(super.x, super.y, {required super.weapons})
      : super(
          enemyHealth: 5,
        );
  @override
  bool get debugMode => true;

  @override
  Color get debugColor => Colors.blue;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // sprite = await game.loadSprite('flutter.png');
  }
}
