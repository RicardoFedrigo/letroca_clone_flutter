import 'dart:math';

import 'package:letroca_clone_flutter/Modules/GameLogic/Word.dart';
import 'package:letroca_clone_flutter/Modules/Levels/LevelAbstration.dart';
import 'package:letroca_clone_flutter/Modules/Levels/level1/Words/WordsA.dart';

import '../../../utils/removeAcentos.dart';
import '../IWords.dart';
import '../LevelImplementation.dart';

class Level1 extends LevelImplementation {
  
  
  Level1() {
    // var words = [new WordsA()];
    // Random random = new Random();
    // var randomWord = random.nextInt(words[0].words.length);
    // var wordsChoose = words[randomWord];
    this.setListOfWords(new WordsA());
  }
}
