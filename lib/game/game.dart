import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:jam_game/enemy/components/enemy_generator.dart';
import 'package:jam_game/game/components/hero.dart';
import 'package:jam_game/game/components/level_generator.dart';
import 'package:jam_game/game/components/level_text.dart';
import 'package:jam_game/game/components/timer_text.dart';

class NewGame extends FlameGame
    with
        HasKeyboardHandlerComponents,
        HasCollisionDetection,
        PanDetector,
        MouseMovementDetector {
  Vector2 mousePosition = Vector2(0, 0);
  int currentLvl = 4;

  static const double heroWidth = 25.0;
  static const double heroHeight = 25.0;
  static final Vector2 heroSize = Vector2(heroWidth, heroHeight);
  late final RouterComponent router;

  NewGame()
      : super(
          camera:
              CameraComponent.withFixedResolution(width: 1920, height: 1080),
        );

  @override
  Future<void> onLoad() async {
    add(SpriteComponent(sprite: await loadSprite('BG_snow.png')));

    final hero = HeroComponent()
      ..size = heroSize
      ..position = Vector2(heroWidth, heroHeight);
    add(hero);
    add(EnemyCreator());

    add(LevelGenerator());

    add(TimerText(position: Vector2(size.x / 2, 50)));

    add(LevelText());

    // add(
    //   router = RouterComponent(
    //     routes: {
    //       'home': Route(NewGame.new),
    //     },
    //     initialRoute: 'home',
    //   ),
    // );

    print(size);
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
