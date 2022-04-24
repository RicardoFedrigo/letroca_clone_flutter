import 'package:letroca_clone_flutter/Modules/GameLogic/Word.dart';
import 'package:letroca_clone_flutter/Modules/Levels/LevelAbstration.dart';
import 'package:letroca_clone_flutter/Modules/Levels/level1/Level1.dart';
import 'package:letroca_clone_flutter/Modules/Levels/level2/Level2.dart';

class GameLogic {
  GameLogic();

  int actualLevel = 0;

  List<LevelAbastraction> levels = [new Level1(), new Level2()];

  int totalPoints = 0;

  LevelAbastraction getLevel() {
    return this.levels[this.actualLevel];
  }

  void addPoints(int points) {
    this.totalPoints += points;
  }

  void nextLevel() {

    if(actualLevel < levels.length - 1) {
      actualLevel++;
      this.totalPoints += this.levels[this.actualLevel].points;
    }
  }

  void resetLevel() {
    this.actualLevel = 0;
  }
}
