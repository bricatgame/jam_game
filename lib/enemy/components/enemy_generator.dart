import 'dart:math';

import 'package:flame/components.dart';
import 'package:jam_game/enemy/components/enemy_icicle.dart';
import 'package:jam_game/enemy/components/enemy_mammoth.dart';
import 'package:jam_game/enemy/components/enemy_reindeer.dart';
import 'package:jam_game/enemy/components/enemy_snowman.dart';
import 'package:jam_game/game/game.dart';
import 'package:jam_game/weapon/components/melee_weapon.dart';

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

    if (game.currentLvl == 1) {
      game.add(
        EnemySnowman(
          mobX,
          mobY,
          weapons: [MeleeWeapon()],
        ),
      );
    }
    if (game.currentLvl == 2) {
      game.add(
        EnemyMammoth(
          mobX,
          mobY,
          weapons: [MeleeWeapon()],
        ),
      );
    }
    if (game.currentLvl == 3) {
      game.add(
        EnemyReindeer(
          mobX,
          mobY,
          weapons: [MeleeWeapon()],
        ),
      );
    }
    if (game.currentLvl == 4) {
      game.add(
        EnemyIcicle(
          mobX,
          mobY,
          weapons: [MeleeWeapon()],
        ),
      );
    }
  }
}
