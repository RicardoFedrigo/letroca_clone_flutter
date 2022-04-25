import 'package:letroca_clone_flutter/Modules/Levels/IWords.dart';

import '../../../GameLogic/Word.dart';

class WordsA implements IWords {
  List<Word> _words = [];
  List<String> _listaLetter = [];
  WordsA() {
    this._words.addAll([
      new Word("amor"),
      new Word("armo"),
      new Word("mora"),
      new Word("roma")
    ]);

    this._listaLetter.addAll(["a", "m", "o", "r"]);
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
