import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

import 'game.dart';

void main() {
  final game = NewGame();
  runApp(GameWidget(game: game));
}
