import 'package:flutter/cupertino.dart';

import '../GameLogic/Word.dart';
import 'IWords.dart';

abstract class LevelAbastraction {
  @protected
  List<String> listaLetter = [];
  @protected
  List<Word> wordToDiscover = [];
  @protected
  int points = 0;

  void setListOfWords(IWords words);
  Word findWord(String word);
  bool wordExists(String word);
  void setPoints(int points);
}