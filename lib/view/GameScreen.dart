import 'dart:developer';
import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:letroca_clone_flutter/Components/CountDownTimer.dart';
import 'package:letroca_clone_flutter/Modules/GameLogic/GameLogic.dart';
import 'package:letroca_clone_flutter/Modules/GameLogic/Word.dart';
import 'package:letroca_clone_flutter/view/GameBody.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../Components/NextLevelButton.dart';
import '../Modules/Levels/LevelAbstration.dart';
import 'WordsToFindInScreen.dart';

class GameScreen extends StatefulWidget {
  late GameLogic _gameLogic;

  GameScreen(GameLogic gameLogic) {
    _gameLogic = gameLogic;
  }

  @override
  State<GameScreen> createState() => _GameScreenState(_gameLogic);
}

class _GameScreenState extends State<GameScreen> {
  late Timer _countdownTimer;
  Duration _myDuration = Duration(minutes: 3);

  @override
  void initState() {
    startTimer();
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = _myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        _countdownTimer!.cancel();
      } else {
        _myDuration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    _countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  late GameLogic _gameLogic;
  late LevelAbastraction _actualLevel;
  late List<Word> _wordsInlevel;
  int _totalPoints = 0;
  double _percent = 0;

  late GameBody _gameBody;

  _GameScreenState(GameLogic gameLogic) {
    _gameLogic = gameLogic;

    _actualLevel = _gameLogic.getLevel();
    print({"actualLevel": _actualLevel});
    _wordsInlevel = _actualLevel.getWordsToDiscover();
    _totalPoints = _actualLevel.points | 0;
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
  }

  GameLogic _nextLevel() {
    _gameLogic.addPoints(_actualLevel.points);
    _countdownTimer.cancel();
    _actualLevel.setFinalDuration(_myDuration);
    return _gameLogic;
  }

  double _percentDiscoverdWord() {
    return _actualLevel.numberDiscovedWord() / _wordsInlevel.length;
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(_myDuration.inMinutes.remainder(60));
    final seconds = strDigits(_myDuration.inSeconds.remainder(60));
    String timer = '$minutes:$seconds';
    return Scaffold(
        backgroundColor: Color(0xFF008F8C),
        appBar: AppBar(
          title: Text("Letroca"),
          actions: <Widget>[
            Container(
              child: Center(
                child: Text(
                  timer,
                  style: TextStyle(fontSize: 20),
                ),
              ),
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
              child: _percent < 0.5
                  ? new LinearPercentIndicator(
                      width: 100.0,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      percent: _percent,
                      center: Text((_percent * 100).toStringAsPrecision(2) + "%"),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.yellow,
                      backgroundColor: Colors.white,
                    )
                  : NextLevelButton(_nextLevel()),
            )),
          ],
        ),
        body: new GameBody(_actualLevel, verifyWord));
  }
}
