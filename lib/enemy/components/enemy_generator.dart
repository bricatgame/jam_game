import 'dart:math';

import 'package:flame/components.dart';
import 'package:jam_game/enemy/components/enemy_icicle.dart';
import 'package:jam_game/enemy/components/enemy_mammoth.dart';
import 'package:jam_game/enemy/components/enemy_reindeer.dart';
import 'package:jam_game/enemy/components/enemy_snowman.dart';
import 'package:jam_game/game/game.dart';
import 'package:jam_game/game/level_strings.dart';
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

    if (game.router.currentRoute.name == LevelStrings.levelFirst) {
      game.add(
        EnemyMammoth(
          mobX + random.nextInt(50),
          mobY + random.nextInt(50),
          weapons: [MeleeWeapon()],
        ),
      );
    }
    if (game.router.currentRoute.name == LevelStrings.levelTwo) {
      game.add(
        EnemySnowman(
          mobX + random.nextInt(50),
          mobY + random.nextInt(50),
          weapons: [Weapon()],
        ),
      );
    }
    if (game.router.currentRoute.name == LevelStrings.levelThree) {
      game.add(
        EnemyReindeer(
          mobX + random.nextInt(50),
          mobY + random.nextInt(50),
          weapons: [Weapon()],
        ),
      );
    }
    if (game.router.currentRoute.name == LevelStrings.levelFour) {
      game.add(
        EnemyIcicle(
          mobX + random.nextInt(50),
          mobY + random.nextInt(50),
          weapons: [Weapon()],
        ),
      );
    }
  }
}
