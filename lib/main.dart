import 'package:flame/game.dart';
import 'package:flappy_bird/flappy_bird_game.dart';
import 'package:flappy_bird/game_over.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyGameWrapper());
}

class MyGameWrapper extends StatefulWidget {
  const MyGameWrapper({super.key});

  @override
  State<MyGameWrapper> createState() => _MyGameWrapperState();
}

class _MyGameWrapperState extends State<MyGameWrapper> {
  late FlappyBirdGame game;

  @override
  void initState() {
    super.initState();
    game = FlappyBirdGame();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GameWidget(
          game: game,
          overlayBuilderMap: {
            'gameOver': (context, _) => GameOverPage(game: game),
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Image(image: AssetImage("assets/images/pause.png")),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      ),
    );
  }
}
