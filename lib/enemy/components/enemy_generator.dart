import 'dart:math';

import 'package:flame/components.dart';
import 'package:jam_game/enemy/components/enemy.dart';
import 'package:jam_game/game/game.dart';
import 'package:jam_game/weapon/components/melee_weapon.dart';
import 'package:jam_game/weapon/components/weapon.dart';

class EnemyCreator extends TimerComponent with HasGameReference<NewGame> {
  Random random = Random();

  EnemyCreator() : super(period: 1, repeat: true);

  @override
  void onTick() {
    final centerX = game.size.x / 2.0;
    final centerY = game.size.y / 2.0;

    final angle = 2 * pi * random.nextDouble();

    const radius = 500;

    final mobX = centerX + radius * cos(angle);
    final mobY = centerY + radius * sin(angle);

    game.add(
      EnemyComponent(
        mobX,
        mobY,
        [MeleeWeapon()],
      ),
    );
  }
}
