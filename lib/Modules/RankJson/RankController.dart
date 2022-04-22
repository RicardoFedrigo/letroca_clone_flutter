import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:letroca_clone_flutter/Modules/RankJson/ModelRank.dart';

class RankController {
  final Dio _dio = Dio();

  ValueNotifier<List<RankJson>> allRanks = ValueNotifier<List<RankJson>>([]);

  getAllRanks() async {
    final Response dioResponse = await _dio.get(
        'https://my-json-server.typicode.com/RicardoFedrigo/letroca_clone_flutter/db');

    allRanks.value = (dioResponse.data as List)
        .map((rankMap) => RankJson.fromJson(rankMap))
        .toList();
  }
}
