import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/flappy_bird_game.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({required PipePosition pipePosition}) : _pipePosition = pipePosition;

  final PipePosition _pipePosition;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load('greenpipe.png');
    final pipeRotated = await Flame.images.load('greenpipe_rotated.png');
    final imageSize = await Flame.images
        .load('greenpipe.png')
        .then((image) => Size(image.width.toDouble(), image.height.toDouble()));

    final random = Random();
    const minHeight = 50;
    const maxHeight = 200;
    final randomHeight = minHeight + random.nextInt(maxHeight - minHeight);

    size = Vector2(imageSize.width, randomHeight.toDouble());

    switch (_pipePosition) {
      case PipePosition.top:
        position = Vector2(
          2 * gameRef.size.x / 3,
          0,
        );
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position = Vector2(
          2 * gameRef.size.x / 3,
          gameRef.size.y - size.y - (gameRef.size.y / 5),
        );
        sprite = Sprite(pipe);
        break;
    }
  }
}

enum PipePosition { top, bottom }
