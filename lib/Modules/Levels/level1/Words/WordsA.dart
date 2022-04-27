import 'package:letroca_clone_flutter/Modules/Levels/IWords.dart';

import '../../../GameLogic/Word.dart';

class WordsA implements IWords {
  List<Word> _words = [];
  List<String> _listaLetter = [];
  WordsA() {
    this._words.addAll([
      new Word("AMOR"),
      new Word("MORA"),
      new Word("ROMA"),
      new Word("MORNA"),
    ]);

    this._listaLetter.addAll(["A", "M", "O", "R", "N"]);
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
