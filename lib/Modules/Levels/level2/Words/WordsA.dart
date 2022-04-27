import 'package:letroca_clone_flutter/Modules/Levels/IWords.dart';

import '../../../GameLogic/Word.dart';

class WordsA implements IWords {
  List<Word> _words = [];
  List<String> _listaLetter = [];
  WordsA() {
    this._words.addAll([
      new Word("AMO"),
      new Word("MOR"),
      new Word("ORA"),
      new Word("MAGO"),
      new Word("GAMO"),
      new Word("MAGRO"),
    ]);

    this._listaLetter.addAll(["M", "G", "O", "R", "A"]);
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
