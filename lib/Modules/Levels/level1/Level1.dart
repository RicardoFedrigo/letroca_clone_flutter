import 'dart:math';

import 'package:letroca_clone_flutter/Modules/GameLogic/Word.dart';
import 'package:letroca_clone_flutter/Modules/Levels/LevelAbstration.dart';
import 'package:letroca_clone_flutter/Modules/Levels/level1/Words/WordsA.dart';

import '../IWords.dart';

class Level1 extends LevelAbastraction {
  Level1() {
    var words = [new WordsA()];

    Random random = new Random();
    var randomWord = random.nextInt(words[0].words.length);
    var wordsChoose = words[randomWord];
    this.setListOfWords(wordsChoose);
  }

  String removerAcentos(String str) {
    var comAcento =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var semAcento =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < comAcento.length; i++) {
      str = str.replaceAll(comAcento[i], semAcento[i]);
    }

    return str.toLowerCase();
  }

  @override
  Word findWord(String word) {
    int index = this.wordToDiscover.indexWhere(
        (element) => removerAcentos(element.word) == removerAcentos(word));

    return this.wordToDiscover[index];
  }

  @override
  void setListOfWords(IWords words) {
    this.wordToDiscover = words.getWords();
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
}
