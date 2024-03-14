import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(BalloonPopGame());
}

class BalloonPopGame extends StatelessWidget {
  const BalloonPopGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balloon Pop Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Timer timer;
  int score = 0;
  int balloonsPopped = 0;
  int balloonsMissed = 0;
  bool isGameOver = false;
  List<Offset> balloons = [];

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timer.tick == 120) {
          endGame();
        }
      });
    });
    generateBalloons();
  }

  void endGame() {
    timer.cancel();
    setState(() {
      isGameOver = true;
    });
  }

  void generateBalloons() {
    Random random = Random();
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        balloons.add(Offset(random.nextDouble() * 300, 600));
      });
    });
  }

  void popBalloon(Offset position) {
    setState(() {
      balloons.remove(position);
      score += 2;
      balloonsPopped++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balloon Pop Game'),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Time: ${120 - timer.tick ~/ 60}:${(120 - timer.tick % 60).toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Score: $score',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          ...balloons.map((balloon) {
            return Positioned(
              left: balloon.dx,
              top: balloon.dy,
              child: GestureDetector(
                onTap: () => popBalloon(balloon),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            );
          }),
          if (isGameOver)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Game Over!',
                    style: TextStyle(fontSize: 36),
                  ),
                  Text(
                    'Score: $score',
                    style: TextStyle(fontSize: 24),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        score = 0;
                        balloonsPopped = 0;
                        balloonsMissed = 0;
                        isGameOver = false;
                      });
                      startGame();
                    },
                    child: Text('Play Again'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
