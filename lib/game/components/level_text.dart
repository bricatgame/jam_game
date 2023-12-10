import 'dart:async';

import 'package:flame/components.dart';
import 'package:jam_game/game/game.dart';

class LevelText extends TextComponent {
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    add(
      TextComponent(
        text: '',
        position: Vector2.all(100),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    final game = findGame()! as NewGame;

    text = '${game.currentLvl}/4';

    position = Vector2(350, 50);
  }
}
