import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/background.dart';
import 'package:flappy_bird/base.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flappy_bird/pipe.dart';
import 'package:flappy_bird/pipe_generation.dart';

class FlappyBirdGame extends FlameGame with TapDetector {
  FlappyBirdGame();

  // double speed = 200;
  late Bird _bird;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Base(),
      _bird = Bird(),
      PipeGeneration(),
    ]);
  }

  @override
  void onTap() {
    super.onTap();
    _bird.fly();
  }
}
