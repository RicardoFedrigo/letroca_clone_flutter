import 'package:flutter/cupertino.dart';

import '../Modules/GameLogic/Word.dart';
import '../Modules/Levels/LevelAbstration.dart';
import 'KeyboardScreen.dart';
import 'WordsToFindInScreen.dart';

class GameBody extends StatefulWidget {
  LevelAbastraction _actualLevel;
  Function _verifyWord;

  GameBody(this._actualLevel, this._verifyWord);

  @override
  State<GameBody> createState() => new _GameBodyState(this._actualLevel, this._verifyWord);
}

class _GameBodyState extends State<GameBody> {
  late LevelAbastraction _actualLevel;
  Function _verifyWord;
  _GameBodyState(this._actualLevel, this._verifyWord){
    print({"_actualLevel": _actualLevel});
    print({"wordsInlevel": _actualLevel.getWordsToDiscover()});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: WordsToFindInScreen(_actualLevel.getWordsToDiscover()),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width/1.5,
              child:
                  KeyboardScreen(_actualLevel.getListaLetter(), _verifyWord)),
        ],
      ),
    );
  }
}
