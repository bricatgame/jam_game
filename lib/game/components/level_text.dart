import 'dart:async';

import 'package:flame/components.dart';
import 'package:jam_game/game/game.dart';

class LevelText extends TextComponent {
  LevelText({super.position});
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    add(
      TextComponent(
        text: '',
        position: Vector2(0, 0),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    final game = findGame()! as NewGame;

    text = '${game.currentLvl}/4';
  }
}
