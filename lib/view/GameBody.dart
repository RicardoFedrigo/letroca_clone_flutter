import 'package:flutter/cupertino.dart';

import '../Modules/GameLogic/Word.dart';
import '../Modules/Levels/LevelAbstration.dart';
import 'KeyboardScreen.dart';
import 'WordsToFindInScreen.dart';

class GameBody extends StatefulWidget {
  LevelAbastraction _actualLevel;
  List<Word> _wordsInlevel;
  Function _verifyWord;

  GameBody(this._actualLevel, this._wordsInlevel, this._verifyWord);

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: WordsToFindInScreen(widget._wordsInlevel),
          ),
          Container(
              child:
                  KeyboardScreen(widget._actualLevel.getListaLetter(), widget._verifyWord)),
        ],
      ),
    );
  }
}
