import 'package:flutter/material.dart';
import 'dart:math';
// ignore: import_of_legacy_library_into_null_safe
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dice'),
        backgroundColor: Colors.red,
      ),
      body: DiceApp(),
      backgroundColor: Colors.redAccent,
    ),
  ));
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  var left = 1;
  var right = 1;
  void playSound() {
    final player = AudioCache();
    player.play('DICE.wav');
  }

  void changeDiceNumber() {
    playSound();
    setState(() {
      left = Random().nextInt(6) + 1;
      right = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceNumber();
              },
              child: Image.asset('images/dice$left.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceNumber();
              },
              child: Image.asset('images/dice$right.png'),
            ),
          ),
        ],
      ),
    );
  }
}
