import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/flappy_bird_game.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({required PipePosition pipePosition, required double height})
      : _pipePosition = pipePosition,
        _height = height;

  final PipePosition _pipePosition;
  final double _height;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load('greenpipe.png');
    final pipeRotated = await Flame.images.load('greenpipe_rotated.png');
    final imageSize = await Flame.images
        .load('greenpipe.png')
        .then((image) => Size(image.width.toDouble(), image.height.toDouble()));
    final imageSizeRotated = await Flame.images
        .load('greenpipe_rotated.png')
        .then((image) => Size(image.width.toDouble(), image.height.toDouble()));

    switch (_pipePosition) {
      case PipePosition.top:
        size = Vector2(imageSizeRotated.width, _height);
        position = Vector2(
          (gameRef.size.x / 2) + size.x,
          0,
        );
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        size = Vector2(imageSize.width, _height);
        position = Vector2(
          (gameRef.size.x / 2) + size.x,
          gameRef.size.y - size.y - (gameRef.size.y / 5),
        );
        sprite = Sprite(pipe);
        break;
    }
    add(RectangleHitbox());
  }
}

enum PipePosition { top, bottom }
