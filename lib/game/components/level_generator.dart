import 'package:flame/components.dart';
import 'package:jam_game/game/game.dart';

class LevelGenerator extends TimerComponent with HasGameReference<NewGame> {
  LevelGenerator() : super(period: 10, repeat: true);

  @override
  void onTick() {
    game.currentLvl++;

    if (game.currentLvl > 4) {
      game.currentLvl = 1;
    }

    print(game.currentLvl);
  }
}
