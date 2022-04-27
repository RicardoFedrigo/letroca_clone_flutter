import 'package:letroca_clone_flutter/Modules/Levels/IWords.dart';

import '../../../GameLogic/Word.dart';

class WordsA implements IWords {
  List<Word> _words = [];
  List<String> _listaLetter = [];
  WordsA() {
    this._words.addAll([
      new Word("ADA"),
      new Word("AGNA"),
      new Word("ANDA"),
      new Word("DAGA"),
      new Word("NADA"),
      new Word("NEGA"),
      new Word("ADEGA"),
      new Word("GANDA"),
      new Word("AGENDA"),
    ]);

    this._listaLetter.addAll(["G", "E", "D", "N", 'A', 'A']);
  }

  get words => _words;
  get letters => _listaLetter;

  @override
  List<String> getLetters() {
    return this._listaLetter;
  }

  @override
  List<Word> getWords() {
    return this._words;
  }
}
