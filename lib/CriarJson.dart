import 'dart:convert';

import 'package:letroca_clone_flutter/Modules/RankJson/ModelRank.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:letroca_clone_flutter/Modules/RankJson/ModelRank.dart';
import 'package:letroca_clone_flutter/values/keyrank.dart';

void dadosranking(
    {int position = 0,
    String pontos = '----',
    String level = '----',
    String tempo = '----',
    String date = '----'}) {
  RankJson ranks = new RankJson(
      position: position,
      pontos: pontos,
      level: level,
      tempo: tempo,
      date: date);

  savedRank(ranks);
  print(ranks);
}

void savedRank(RankJson rank) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(rankkey.activerank, json.encode(rank.toJson()));
}
