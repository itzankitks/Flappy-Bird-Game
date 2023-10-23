import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/base.dart';
import 'package:flappy_bird/flappy_bird_game.dart';
import 'package:flutter/widgets.dart';

class Bird extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Bird();

  final velocity = 200;
  final fps = 120;
  final gravity = 3;
  @override
  FutureOr<void> onLoad() async {
    final birdUp = await Flame.images.load('bird_up.png');
    // size = Vector2(50, 50);
    final imageSize = await Flame.images.load('bird_up.png').then((image) =>
        Size(image.width.toDouble() + 5, image.height.toDouble() + 5));
    size = Vector2(imageSize.width, imageSize.height);
    position = Vector2(gameRef.size.x / 5, (gameRef.size.y - size.y) / 2);
    sprite = Sprite(birdUp);
    // final birdDown = await Flame.images.load('bird_down.png');
    // final birdMid = await Flame.images.load('bird_mid.png');
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += gravity;
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, -100),
        EffectController(
          duration: 0.2,
          curve: Curves.decelerate,
        ),
      ),
    );
  }
}
