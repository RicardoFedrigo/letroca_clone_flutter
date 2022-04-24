import 'package:flutter/cupertino.dart';
import 'package:letroca_clone_flutter/view/WordsToFindInScreen.dart';

import '../GameLogic/Word.dart';
import 'IWords.dart';

abstract class LevelAbastraction {
  @protected
  List<String> listaLetter = [];
  @protected
  List<Word> wordsToDiscover = [];
  @protected
  int points = 0;
  @protected
  List<Word> discovedWord = [];


  List<String> getListaLetter();
  List<Word> getWordsToDiscover();
  void setListOfWords(IWords words);
  Word findWord(String word);
  bool wordExists(String word);
  List<Word> getDiscovedWord();
  int numberDiscovedWord();
  void setPoints(int points);
  int getPoints();
}