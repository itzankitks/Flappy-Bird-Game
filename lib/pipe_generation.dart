import 'package:flame/components.dart';
import 'package:flappy_bird/flappy_bird_game.dart';
import 'package:flappy_bird/pipe.dart';

class PipeGeneration extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGeneration();
  // final List<Pipe> pipes = [];

  @override
  Future<void> onLoad() async {
    addAll([
      Pipe(pipePosition: PipePosition.top),
      Pipe(pipePosition: PipePosition.bottom),
    ]);
    // for (int i = 0; i < 5; i++) {
    //   final pipe = Pipe();
    //   await pipe.onLoad();
    //   pipes.add(pipe);
    // }
  }
}
