import 'dart:math';

import 'package:letroca_clone_flutter/Modules/GameLogic/Word.dart';
import 'package:letroca_clone_flutter/Modules/Levels/LevelAbstration.dart';
import 'package:letroca_clone_flutter/Modules/Levels/level1/Words/WordsA.dart';

import '../../../utils/removeAcentos.dart';
import '../IWords.dart';

class Level1 extends LevelAbastraction {
  Level1() {
    var words = [new WordsA()];

    Random random = new Random();
    // var randomWord = random.nextInt(words[0].words.length);
    // var wordsChoose = words[randomWord];
    // this.setListOfWords(wordsChoose);

    this.setListOfWords(words[0]);
  }

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
    //Nota ver se ele devolve o uma copia do objeto ou seja se ele altera o objeto que esta no array
    Word wordExist = this.findWord(word);

    if (wordExist == null) {
      return false;
    }

    wordExist.isFound = true;
    this.setPoints(wordExist.word.length);

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
  void discovedWord(String word) {
    int index = this.wordsToDiscover.indexWhere(
        (element) => removerAcentos(element.word) == removerAcentos(word));
    this.wordsToDiscover[index].isFound = true;
  }
}
