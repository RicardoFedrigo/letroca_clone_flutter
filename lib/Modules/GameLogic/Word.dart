class Word {
  String _word;
  bool _isFound = false;

  Word(this._word);

  String get word => _word;
  bool get isFound => _isFound;
  get length => _word.length;
  
  String letter (int index) => _word[index];

  set isFound(bool value) {
    _isFound = value;
  }

  set word(String value) {
    _word = value;
  }
}