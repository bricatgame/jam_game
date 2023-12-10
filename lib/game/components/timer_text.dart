import 'dart:async';

import 'package:flame/components.dart';
import 'package:jam_game/game/components/level_generator.dart';

class TimerText extends TextComponent {
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    add(
      TextComponent(
        text: '',
        position: Vector2(0, 50),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    final game = findGame();

    final currentTime = maxLevelTime -
        (game?.firstChild<LevelGenerator>()!.timer.current ?? 0.0);

    text = currentTime.ceil().toString();

    position = Vector2(0, 50);
  }
}
