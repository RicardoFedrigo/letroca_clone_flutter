import '../GameLogic/Word.dart';

abstract class IWords {
  List<Word> getWords();
  List<String> getLetters();
}