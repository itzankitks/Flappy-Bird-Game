import 'package:flame/game.dart';
import 'package:flappy_bird/background.dart';
import 'package:flappy_bird/base.dart';

class FlappyBirdGame extends FlameGame {
  FlappyBirdGame();

  @override
  Future<void> onLoad() async {
    add(Background());
    add(Base());
  }
}
