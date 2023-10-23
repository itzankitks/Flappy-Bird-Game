// import 'package:flame/components.dart';
// import 'package:flame/flame.dart';
// import 'package:flappy_bird/game.dart';

// class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
//   Background();

//   @override
//   Future<void> onLoad() async {
//     final img = await Flame.images.load('/assets/images/game_bg.png');
//     size = gameRef.size;
//     sprite = Sprite(img);
//   }
// }

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/flappy_bird_game.dart';

class Base extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Base();

  @override
  Future<void> onLoad() async {
    final img = await Flame.images.load('base.png');
    size = Vector2(gameRef.size.x, 110);
    sprite = Sprite(img);
  }
}
