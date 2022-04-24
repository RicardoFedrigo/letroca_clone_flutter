import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:letroca_clone_flutter/Components/CountDownTimer.dart';
import 'package:letroca_clone_flutter/Components/PoitsCount.dart';
import 'package:letroca_clone_flutter/Modules/GameLogic/GameLogic.dart';
import 'package:letroca_clone_flutter/Modules/GameLogic/Word.dart';
import 'package:letroca_clone_flutter/view/GameBody.dart';
import 'package:letroca_clone_flutter/view/KeyboardScreen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../Components/NextLevelButton.dart';
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
  int _totalPoints = 0;
  double _percent = 0;

  late GameBody _gameBody;

  _GameScreenState() {
    _actualLevel = _gameLogic.getLevel();
    _wordsInlevel = _actualLevel.getWordsToDiscover();
    _totalPoints;
    _gameBody = new GameBody(_actualLevel, _wordsInlevel, verifyWord);
  }

  void verifyWord(String word) {
    if (word != "") {
      bool wordExist = _actualLevel.wordExists(word);
      if (wordExist) {
        setState(() {
          _totalPoints = _actualLevel.getPoints();
          _wordsInlevel = _actualLevel.getWordsToDiscover();
          _percent = _percentDiscoverdWord();
        });
      }
    }
    print({"actualLevel": _actualLevel, "totalPoints": _totalPoints});
  }

  void _nextLevel() {
    _gameLogic.nextLevel();
    _actualLevel = _gameLogic.getLevel();
    _wordsInlevel = _actualLevel.getWordsToDiscover();
    _totalPoints = _actualLevel.getPoints();
    _percent = _percentDiscoverdWord();


    print({"actualLevel": _actualLevel, "totalPoints": _totalPoints});

    setState(() {
      _totalPoints = _actualLevel.getPoints();
      _wordsInlevel = _actualLevel.getWordsToDiscover();
      _percent = _percentDiscoverdWord();
    });
  }

  double _percentDiscoverdWord() {
    return _actualLevel.numberDiscovedWord() / _wordsInlevel.length;
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
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(color: Colors.black)),
            child: Text(
              "$_totalPoints",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          Container(
              child: Padding(
            padding: EdgeInsets.all(15.0),
            child: _percent > 0.5
                ? new LinearPercentIndicator(
                    width: 100.0,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2500,
                    percent: _percent,
                    center: Text((_percent * 100).toString() + "%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.yellow,
                    backgroundColor: Colors.white,
                  )
                : NextLevelButton(_nextLevel),
          )),
        ],
      ),
      body: _gameBody
    );
  }
}
