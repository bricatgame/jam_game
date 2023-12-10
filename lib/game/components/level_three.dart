import 'package:flame/components.dart';
import 'package:jam_game/game/game.dart';

class LevelThree extends Component {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final game = findGame()! as NewGame;
  }
}
