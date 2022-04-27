import 'dart:async';

import 'package:letroca_clone_flutter/Modules/Levels/LevelAbstration.dart';

import '../../utils/removeAcentos.dart';
import '../GameLogic/Word.dart';
import 'IWords.dart';

class LevelImplementation extends LevelAbastraction {
  @override
  Word findWord(String word) {
    int index = this.wordsToDiscover.indexWhere(
        (element) => removerAcentos(element.word) == removerAcentos(word));

    return this.wordsToDiscover[index];
  }

  @override
  void setListOfWords(IWords words) {
    this.wordsToDiscover = words.getWords();
    this.listaLetter = words.getLetters();
  }

  @override
  void setPoints(int points) {
    this.points += points;
  }

  @override
  bool wordExists(String word) {
    int index = this.wordsToDiscover.indexWhere(
        (element) => removerAcentos(element.word) == removerAcentos(word));

    if (index == -1) return false;
    if (this.wordsToDiscover[index].isFound) return false;

    this.wordsToDiscover[index].isFound = true;

    this.discovedWord.add(this.wordsToDiscover[index]);

    this.setPoints(this.wordsToDiscover[index].word.length);

    return true;
  }

  @override
  List<String> getListaLetter() {
    return this.listaLetter;
  }

  @override
  List<Word> getWordsToDiscover() {
    return this.wordsToDiscover;
  }

  @override
  int getPoints() {
    return this.points;
  }

  @override
  int numberDiscovedWord() {
    return this.discovedWord.length;
  }

  @override
  List<Word> getDiscovedWord() {
    return this.discovedWord;
  }
  
  @override
  double porcentageDiscovedWord() {
    return (this.discovedWord.length / this.wordsToDiscover.length);
  }

  @override
  void setFinalDuration(Duration myDuration) {
    this.myDuration = myDuration;
  }
  
  @override
  Duration getFinalTime() {
      return this.myDuration;
  }
}
