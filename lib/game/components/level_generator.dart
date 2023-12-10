import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:jam_game/game/game.dart';

const double maxLevelTime = 30;
late AudioPool pool;

class LevelGenerator extends TimerComponent with HasGameReference<NewGame> {
  LevelGenerator() : super(period: maxLevelTime, repeat: true);

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    pool = await FlameAudio.createPool(
      'mixkit-arcade-game-complete-or-approved-mission-205.wav',
      maxPlayers: 4,
    );
  }

  @override
  void onTick() {
    game.currentLvl++;

    if (game.currentLvl > 4) {
      game.win();
    } else {
      pool.start();
    }
  }
}
