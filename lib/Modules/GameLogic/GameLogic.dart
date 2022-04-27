import 'dart:async';

import 'package:letroca_clone_flutter/Modules/GameLogic/Word.dart';
import 'package:letroca_clone_flutter/Modules/Levels/LevelAbstration.dart';
import 'package:letroca_clone_flutter/Modules/Levels/level1/Level1.dart';
import 'package:letroca_clone_flutter/Modules/Levels/level2/Level2.dart';
import 'package:letroca_clone_flutter/Modules/Levels/level3/Level3.dart';

class GameLogic {
  GameLogic();

  int actualLevel = 0;

  List<LevelAbastraction> levels = [new Level1(), new Level2(), new Level3()];

  int totalPoints = 0;

  LevelAbastraction getLevel() {
    return this.levels[this.actualLevel];
  }

  void addPoints(int points) {
    this.totalPoints += points;
  }

  void nextLevel() {
    if (actualLevel < levels.length) {
      this.totalPoints += this.levels[this.actualLevel].points;
      this.actualLevel++;
    }
  }

  Duration getTotalTimer() {
    int totalTimer = 0;
    levels.forEach((level) => totalTimer += level.getFinalTime().inSeconds);

    int tempoGasto = (actualLevel + 1) * 60 * 3;
    int finalTimer = tempoGasto + totalTimer;
    int inSeconds = finalTimer % 60;
    int inMinutes = ((finalTimer / 60)).toInt();

    return new Duration(minutes: inMinutes, seconds: inSeconds);
  }

  void resetLevel() {
    this.actualLevel = 0;
  }
}
