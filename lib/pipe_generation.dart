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
    final heightMinusGround = 4 * (gameRef.size.y / 5);

    final spacing = 90 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinusGround - spacing);
    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(
          pipePosition: PipePosition.bottom,
          height: heightMinusGround - (centerY + spacing / 2)),
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
