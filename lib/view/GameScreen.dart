import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:letroca_clone_flutter/Components/CountDownTimer.dart';
import 'package:letroca_clone_flutter/Modules/GameLogic/GameLogic.dart';
import 'package:letroca_clone_flutter/Modules/GameLogic/Word.dart';
import 'package:letroca_clone_flutter/view/KeyboardScreen.dart';

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

  _GameScreenState() {
    _actualLevel = _gameLogic.getLevel();
    _wordsInlevel = _actualLevel.getWordsToDiscover();
  }

  void verifyWord(String word) {
    bool wordExist = _actualLevel.wordExists(word);
    if (wordExist) {
      _actualLevel.discovedWord(word);
    }
  }

  WordsToFindInScreen _wordsToFindInScreen() {
    return  WordsToFindInScreen(_wordsInlevel);
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
              child :_wordsToFindInScreen(),
            ),
            Container(
                child: KeyboardScreen(
                    _actualLevel.getListaLetter(), verifyWord)),
          ],
        ),
      ),
    );
  }
}
