import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/background.dart';
import 'package:flappy_bird/base.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flappy_bird/pipe_generation.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBirdGame();

  double speed = 200;
  double fps = 120;
  late Bird _bird;
  double _timeSinceLastPipeGenerated = 0;
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

  @override
  void update(double dt) {
    super.update(dt);
    _timeSinceLastPipeGenerated += dt;
    if (_timeSinceLastPipeGenerated > 1.5) {
      add(PipeGeneration());
      _timeSinceLastPipeGenerated = 0;
    }
  }
}
