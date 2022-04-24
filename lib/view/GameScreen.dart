import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:letroca_clone_flutter/Components/CountDownTimer.dart';
import 'package:letroca_clone_flutter/Components/PoitsCount.dart';
import 'package:letroca_clone_flutter/Modules/GameLogic/GameLogic.dart';
import 'package:letroca_clone_flutter/Modules/GameLogic/Word.dart';
import 'package:letroca_clone_flutter/view/KeyboardScreen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../Modules/Levels/LevelAbstration.dart';
import 'WordsToFindInScreen.dart';

class GameScreen extends StatefulWidget {
  GameScreen();

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameLogic _gameLogic = new GameLogic();

  late LevelAbastraction _actualLevel;
  late List<Word> _wordsInlevel;
  late int _totalPoints;

  _GameScreenState() {
    _actualLevel = _gameLogic.getLevel();
    _wordsInlevel = _actualLevel.getWordsToDiscover();
    _totalPoints = 0;
  }

  void verifyWord(String word) {
    var wordWithOutWitheSpace = word.replaceAll(" ", "");
    if (wordWithOutWitheSpace != "") {
      bool wordExist = _actualLevel.wordExists(wordWithOutWitheSpace);
      if (wordExist) {
        setState(() {
          _totalPoints = _actualLevel.getPoints();
          _wordsInlevel = _actualLevel.getWordsToDiscover();
        });
      }
    }
  }

  WordsToFindInScreen _wordsToFindInScreen() {
    return WordsToFindInScreen(_wordsInlevel);
  }

  @override
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
              "$_totalPoints",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: 100.0,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2500,
                percent: 0.8,
                center: Text("80.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: _wordsToFindInScreen(),
            ),
            Container(
                child:
                    KeyboardScreen(_actualLevel.getListaLetter(), verifyWord)),
          ],
        ),
      ),
    );
  }
}
