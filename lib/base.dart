import 'package:flame/components.dart';
import 'package:flame/flame.dart';
// import 'package:flame/parallax.dart';
import 'package:flappy_bird/flappy_bird_game.dart';

class Base extends PositionComponent with HasGameRef<FlappyBirdGame> {
  Base();

  @override
  Future<void> onLoad() async {
    final img = await Flame.images.load('base.png');
    size = Vector2(gameRef.size.x, gameRef.size.y / 5);
    position = Vector2(0, 4 * (gameRef.size.y / 5));
    add(SpriteComponent(sprite: Sprite(img), size: size));
  }
}

// class Base extends ParallaxComponent<FlappyBirdGame>
//     with HasGameRef<FlappyBirdGame> {
//   Base();

//   @override
//   Future<void> onLoad() async {
//     final img = await Flame.images.load('base.png');
//     size = Vector2(gameRef.size.x, 110);
//     position = Vector2(0, gameRef.size.y - size.y);
//     parallax = Parallax([
//       ParallaxLayer(
//         ParallaxImage(img, fill: LayerFill.none),
//       ),
//     ]);
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//     parallax?.baseVelocity.x = gameRef.speed;
//   }
// }
