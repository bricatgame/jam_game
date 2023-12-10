import 'package:flame/components.dart';
import 'package:jam_game/game/game.dart';

const double maxLevelTime = 10;

class LevelGenerator extends TimerComponent with HasGameReference<NewGame> {
  LevelGenerator() : super(period: maxLevelTime, repeat: true);

  @override
  void onTick() {
    game.currentLvl++;

    if (game.currentLvl > 4) {
      game.currentLvl = 1;
    }
  }
}
