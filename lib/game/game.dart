import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:jam_game/enemy/components/enemy_generator.dart';
import 'package:jam_game/game/components/background.dart';
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
  int currentLvl = 1;

  static const double heroWidth = 64.0;
  static const double heroHeight = 64.0;
  static final Vector2 heroSize = Vector2(heroWidth, heroHeight);
  late final RouterComponent router;

  late Sprite death;

  late Sprite winner;
  late AudioPool winPool;
  late AudioPool deathPool;

  NewGame();

  @override
  Future<void> onLoad() async {
    winPool = await FlameAudio.createPool(
      'mixkit-game-level-completed-2059.wav',
      maxPlayers: 4,
    );
    deathPool = await FlameAudio.createPool(
      'mixkit-magical-game-over-1943.wav',
      maxPlayers: 4,
    );
    death = await loadSprite('loser1.png');
    winner = await loadSprite('winner.png');

    camera.viewfinder.anchor = Anchor.topLeft;

    add(Background(sprite: await loadSprite('BG_snow.png')));
    add(Background(sprite: await loadSprite('BG_objects.png'), priority: 100));

    final hero = HeroComponent()
      ..size = heroSize
      ..position = Vector2(heroWidth, heroHeight);
    add(hero);
    add(EnemyCreator());

    add(LevelGenerator());

    add(TimerText(position: Vector2(size.x / 2, 50)));

    add(LevelText(position: Vector2(10, 50)));

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

  void dead() {
    removeWhere((component) => true);
    deathPool.start();
    add(Background(sprite: death));
  }

  void win() {
    removeWhere((component) => true);
    winPool.start();
    add(Background(sprite: winner));
  }
}
