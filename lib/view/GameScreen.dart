import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:letroca_clone_flutter/Components/CountDownTimer.dart';
import 'package:letroca_clone_flutter/view/KeyboardScreen.dart';
import 'package:letroca_clone_flutter/view/PlayerName.dart';

import 'WordsToFindInScreen.dart';

class GameScreen extends StatelessWidget {
  String _playerName;

  GameScreen(String playerName) : _playerName = playerName;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Letroca"),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 20, bottom: 10),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: CountDownTimer(),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(
              "Pontos",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(
              "level",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: WordsToFindInScreen(),
            ),
            Container(
                alignment: Alignment.bottomCenter, child: KeyboardScreen())
          ],
        ),
      ),
    );
  }
}
