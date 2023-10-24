import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/flappy_bird_game.dart';
import 'package:flappy_bird/pipe.dart';

class PipeGeneration extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGeneration();
  // final List<Pipe> pipes = [];

  final Random _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;
    const minHeight = 50;
    const maxHeight = 300;
    final randomHeight = minHeight + _random.nextInt(maxHeight - minHeight);
    addAll([
      Pipe(
        pipePosition: PipePosition.top,
        height: randomHeight.toDouble(),
      ),
      Pipe(
        pipePosition: PipePosition.bottom,
        height: randomHeight.toDouble(),
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= gameRef.speed * dt;
    if (position.x < -gameRef.size.x) {
      removeFromParent();
    }
  }
}
