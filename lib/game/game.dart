import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:jam_game/enemy/components/enemy_generator.dart';
import 'package:jam_game/game/components/hero.dart';
import 'package:jam_game/game/components/level_four.dart';
import 'package:jam_game/game/components/level_generator.dart';
import 'package:jam_game/game/components/level_three.dart';
import 'package:jam_game/game/components/level_two.dart';
import 'package:jam_game/game/level_strings.dart';

class NewGame extends FlameGame
    with
        HasKeyboardHandlerComponents,
        HasCollisionDetection,
        PanDetector,
        MouseMovementDetector {
  Vector2 mousePosition = Vector2(0, 0);

  static const double heroWidth = 25.0;
  static const double heroHeight = 25.0;
  static final Vector2 heroSize = Vector2(heroWidth, heroHeight);
  late final RouterComponent router;

  @override
  Future<void> onLoad() async {
    final hero = HeroComponent()
      ..size = heroSize
      ..position = Vector2(heroWidth, heroHeight);
    add(hero);
    add(EnemyCreator());

    add(LevelGenerator());

    add(
      router = RouterComponent(
        routes: {
          LevelStrings.levelFirst: Route(NewGame.new),
          LevelStrings.levelTwo: Route(LevelTwo.new),
          LevelStrings.levelThree: Route(LevelThree.new),
          LevelStrings.levelFour: Route(LevelFour.new),
        },
        initialRoute: LevelStrings.levelFirst,
      ),
    );

    camera.viewfinder.visibleGameSize = Vector2(200, 200);
    camera.viewfinder.position = Vector2(heroWidth * 3.5, heroHeight);
    camera.viewfinder.anchor = Anchor.topLeft;
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    super.onPanUpdate(info);

    mousePosition = info.eventPosition.widget;
    firstChild<HeroComponent>()?.move(info.eventPosition.widget);
  }

  @override
  void onPanEnd(DragEndInfo info) {
    super.onPanEnd(info);
    firstChild<HeroComponent>()?.stopMove();
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    super.onMouseMove(info);
    mousePosition = info.eventPosition.widget;
  }
}
