import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:letroca_clone_flutter/values/keyrank.dart';

import 'Modules/RankJson/ModelRank.dart';

Future<RankJson> getRank() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var jsonRank = pref.getString(rankkey.activerank);
  print(jsonRank);

  Map<String, dynamic> mapRank = json.decode(jsonRank!);
  RankJson rank = RankJson.fromJson(mapRank);
  return rank;
}
