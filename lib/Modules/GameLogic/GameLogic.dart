import 'package:letroca_clone_flutter/Modules/GameLogic/Word.dart';
import 'package:letroca_clone_flutter/Modules/Levels/LevelAbstration.dart';
import 'package:letroca_clone_flutter/Modules/Levels/level1/Level1.dart';

class GameLogic {
  GameLogic();

  int actualLevel = 1;
  List<LevelAbastraction> levels = [new Level1()];

  int totalPoints = 0;

  LevelAbastraction getLevel() {
    return this.levels[this.actualLevel];
  }

  void nextLevel() {
    this.actualLevel++;
    this.totalPoints += this.levels[this.actualLevel].points;
  }

  void resetLevel() {
    this.actualLevel = 1;
  }
}
