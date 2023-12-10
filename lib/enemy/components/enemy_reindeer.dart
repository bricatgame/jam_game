import 'package:flutter/material.dart';
import 'package:jam_game/enemy/components/enemy.dart';

class EnemyReindeer extends EnemyComponent {
  EnemyReindeer(super.x, super.y, {required super.weapons})
      : super(
          enemyHealth: 3,
        );
  @override
  bool get debugMode => true;

  @override
  Color get debugColor => Colors.yellow;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // sprite = await game.loadSprite('flutter.png');
  }
}
