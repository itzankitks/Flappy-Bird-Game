import 'package:flame/game.dart';
import 'package:flappy_bird/flappy_bird_game.dart';
import 'package:flappy_bird/game_over.dart';
import 'package:flappy_bird/pause_game.dart';
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

  bool isPauseOverlayVisible = false;
  bool isGameOverOverlayVisible = false;

  @override
  void initState() {
    super.initState();
    game = FlappyBirdGame();
  }

  // void showPauseOverlay() {
  //   if (!game.collision && !isGameOverOverlayVisible) {
  //     setState(() {
  //       isPauseOverlayVisible = true;
  //       game.pause();
  //     });
  //   }
  // }

  void onGameCollision() {
    setState(() {
      game.collision = true;
      isPauseOverlayVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            GameWidget(
              game: game,
              overlayBuilderMap: {
                'gameOver': (context, _) => GameOverPage(game: game),
                'paused': (context, _) => PauseMenu(game: game),
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: game.collision ? null : game.pauseGame,
          backgroundColor: game.collision ? Colors.grey : null,
          disabledElevation: 0.0,
          focusElevation: 5.0,
          highlightElevation: 0.0,
          hoverElevation: 0.0,
          child: const Image(image: AssetImage("assets/images/pause.png")),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      ),
    );
  }
}


// if (isPauseOverlayVisible)
//               Positioned.fill(
//                 child: Center(
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     height: 2 * MediaQuery.of(context).size.height / 5,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const SizedBox(
//                           width: 200,
//                           height: 75,
//                           child: Image(
//                             image: AssetImage("assets/images/paused.png"),
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 child: Column(
//                                   children: [
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           isPauseOverlayVisible = false;
//                                           game.resumeEngine();
//                                         });
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.transparent,
//                                         shadowColor: Colors.transparent,
//                                       ),
//                                       child: Container(
//                                         width: 50,
//                                         height: 50,
//                                         decoration: BoxDecoration(
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color:
//                                                   Colors.black.withOpacity(0.5),
//                                               spreadRadius: 2,
//                                               blurRadius: 7,
//                                               offset: const Offset(0, 3),
//                                             ),
//                                           ],
//                                         ),
//                                         child: const Image(
//                                           image: AssetImage(
//                                               "assets/images/resume.png"),
//                                           fit: BoxFit.contain,
//                                         ),
//                                       ),
//                                     ),
//                                     const Padding(
//                                       padding: EdgeInsets.all(8.0),
//                                       child: Text("Resume"),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Column(
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         isPauseOverlayVisible = false;
//                                         game.resumeEngine();
//                                       });
//                                     },
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.transparent,
//                                       shadowColor: Colors.transparent,
//                                     ),
//                                     child: Container(
//                                       width: 50,
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.5),
//                                             spreadRadius: 2,
//                                             blurRadius: 7,
//                                             offset: const Offset(0, 3),
//                                           ),
//                                         ],
//                                       ),
//                                       child: const Image(
//                                         image: AssetImage(
//                                             "assets/images/resume.png"),
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.all(8.0),
//                                     child: Text("Resume"),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),