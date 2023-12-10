import 'package:flame/components.dart';
import 'package:jam_game/game/game.dart';

class LevelGenerator extends TimerComponent with HasGameReference<NewGame> {
  LevelGenerator() : super(period: 10, repeat: true);

  @override
  void onTick() {
    print('ITS WORK ${game.currentLvl}');

    game.router.pushNamed('level_two');
  }
}