class Word {
  String _word;
  bool _isFound = false;

  Word(this._word);

  String get word => _word;
  bool get isFound => _isFound;

  set isFound(bool value) {
    _isFound = value;
  }

  set word(String value) {
    _word = value;
  }
}