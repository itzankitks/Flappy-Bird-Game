import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/flappy_bird_game.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final img = await Flame.images.load('game_bg.png');
    size = gameRef.size;
    sprite = Sprite(img);
  }
}
