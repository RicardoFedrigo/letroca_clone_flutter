import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letroca_clone_flutter/view/WordToDIscover.dart';

import '../Modules/GameLogic/Word.dart';

class WordsToFindInScreen extends StatelessWidget {
  List<Word> _words;

  WordsToFindInScreen(List<Word> this._words);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: ListView(
          children: List.generate(5, (index) => WordToDiscover(_words[index])),
        ),
      ),
    );
  }
}
