import 'package:letroca_clone_flutter/Modules/GameLogic/Word.dart';
import 'package:letroca_clone_flutter/Modules/Levels/LevelAbstration.dart';
import 'package:letroca_clone_flutter/Modules/Levels/level1/Level1.dart';

class GameLogic {
  GameLogic();

  List<LevelAbastraction> levels = [new Level1()];

  LevelAbastraction getLevel(int level) {
    return levels[level];
  }
  
}