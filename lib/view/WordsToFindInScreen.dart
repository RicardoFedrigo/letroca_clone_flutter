import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letroca_clone_flutter/Components/wordsScreen/WordToDIscover.dart';

import '../Modules/GameLogic/Word.dart';

class WordsToFindInScreen extends StatefulWidget {
  List<Word> _words;

  WordsToFindInScreen(List<Word> this._words);

  @override
  State<WordsToFindInScreen> createState() =>
      _WordsToFindInScreenState(this._words);
}

class _WordsToFindInScreenState extends State<WordsToFindInScreen> {
  List<Word> _words;

  _WordsToFindInScreenState(List<Word> this._words);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 350,
        child: ListView(
          children: List.generate(
              _words.length, (index) => WordToDiscover(_words[index])),
        ),
      ),
    );
  }
}
