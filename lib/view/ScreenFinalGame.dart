import 'dart:async';

import 'package:flutter/material.dart';
import 'package:letroca_clone_flutter/CriarJson.dart';
import 'package:letroca_clone_flutter/Modules/GameLogic/GameLogic.dart';
import 'package:letroca_clone_flutter/Ranking.dart';
import 'package:letroca_clone_flutter/view/GameScreen.dart';

import '../Modules/RankJson/ModelRank.dart';
import '../home.dart';
import '../pegarRank.dart';

String dataAgora() {
  DateTime dias = DateTime.now();
  int dia = dias.day;
  int mes = dias.month;

  return '$dia/$mes';
}

void addRanking(int pontos, int level, int minutos, int segundos) async {
  RankJson ranks = await getRank();
  int pontosRank = int.parse(ranks.pontos.toString());
  int posicaoRank = int.parse(ranks.position.toString());
  int posicaRankProx = pontosRank + 1;
  String timer = '$minutos:$segundos';
  if (ranks.position == null) {
    dadosranking(
        position: 1,
        pontos: pontos.toString(),
        level: level.toString(),
        tempo: timer,
        date: dataAgora());
  } else if (pontos > pontosRank) {
    dadosranking(
        position: posicaoRank,
        pontos: pontos.toString(),
        level: level.toString(),
        tempo: timer,
        date: dataAgora());
  } else {
    dadosranking(
        position: posicaRankProx,
        pontos: pontos.toString(),
        level: level.toString(),
        tempo: timer,
        date: dataAgora());
  }
}

class ScreenFinalGame extends StatefulWidget {
  GameLogic _gameLogic;
  ScreenFinalGame(this._gameLogic);

  @override
  State<ScreenFinalGame> createState() => _ScreenFinalGameState();
}

class _ScreenFinalGameState extends State<ScreenFinalGame> {
  _getTotalTimer() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addRanking(
        widget._gameLogic.totalPoints,
        widget._gameLogic.actualLevel + 1,
        widget._gameLogic.getTotalTimer().inMinutes,
        widget._gameLogic.getTotalTimer().inSeconds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF008F8C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('img/finalgame.png'),
            SizedBox(
              height: 50.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    child: Text(
                      'LEVEL',
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5.0,
                              offset: Offset(
                                1.0, // Move to right 10  horizontally
                                3.0, // Move to bottom 10 Vertically
                              ), // soften the shadow
                            )
                          ]),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(65, 15, 65, 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          //background color of box
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5.0,
                            offset: Offset(
                              1.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ), // soften the shadow
                          )
                        ],
                        color: Colors.white,
                        border: Border.all(
                          width: 1.0,
                          color: Colors.black,
                        )),
                    child: Text('${widget._gameLogic.actualLevel + 1}',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Container(
                    child: Text(
                      'PONTOS PARTIDA',
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5.0,
                              offset: Offset(
                                1.0, // Move to right 10  horizontally
                                3.0, // Move to bottom 10 Vertically
                              ), // soften the shadow
                            )
                          ]),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(55, 15, 55, 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          //background color of box
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5.0,
                            offset: Offset(
                              1.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ), // soften the shadow
                          )
                        ],
                        color: Colors.white,
                        border: Border.all(
                          width: 1.0,
                          color: Colors.black,
                        )),
                    child: Text('${widget._gameLogic.totalPoints}',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Container(
                    child: Text(
                      'TEMPO PARTIDA',
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5.0,
                              offset: Offset(
                                1.0, // Move to right 10  horizontally
                                3.0, // Move to bottom 10 Vertically
                              ), // soften the shadow
                            )
                          ]),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          //background color of box
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5.0,
                            offset: Offset(
                              1.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ), // soften the shadow
                          )
                        ],
                        color: Colors.white,
                        border: Border.all(
                          width: 1.0,
                          color: Colors.black,
                        )),
                    child: Text(
                        '${widget._gameLogic.getTotalTimer().inMinutes}:${widget._gameLogic.getTotalTimer().inSeconds}',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                      },
                      child: Text('TELA INICIAL',
                          style: TextStyle(color: Colors.black)),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          minimumSize: MaterialStateProperty.all(Size(100, 40)),
                          overlayColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 204, 204, 204)),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 255, 255, 255))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ranking(),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text('RANKING',
                            style: TextStyle(color: Colors.black)),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          minimumSize: MaterialStateProperty.all(Size(100, 40)),
                          overlayColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 204, 204, 204)),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 255, 255, 255))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  new GameScreen(new GameLogic()),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                        child: Text('NOVO JOGO',
                            style: TextStyle(color: Colors.black)),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          minimumSize: MaterialStateProperty.all(Size(100, 40)),
                          overlayColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 204, 204, 204)),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 255, 255, 255))),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
