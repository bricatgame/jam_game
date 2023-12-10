import 'package:flame/components.dart';
import 'package:jam_game/game/game.dart';
import 'package:jam_game/game/level_strings.dart';

class LevelGenerator extends TimerComponent with HasGameReference<NewGame> {
  LevelGenerator() : super(period: 10, repeat: true);

  @override
  void onTick() {
    switch (game.router.currentRoute.name) {
      case LevelStrings.levelFirst:
        game.router.pushNamed(LevelStrings.levelTwo);
        break;
      case LevelStrings.levelTwo:
        game.router.pushNamed(LevelStrings.levelThree);
        break;
      case LevelStrings.levelThree:
        game.router.pushNamed(LevelStrings.levelFour);
        break;
    }
  }
}
