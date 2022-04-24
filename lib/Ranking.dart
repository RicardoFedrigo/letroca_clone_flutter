import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/widgets/container.dart';
import 'dart:convert';
import 'package:letroca_clone_flutter/Modules/RankJson/ModelRank.dart';
import 'package:http/http.dart' as http;
import 'package:letroca_clone_flutter/values/keyrank.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:core';
import 'home.dart';
import 'pegarRank.dart';
import 'dart:ui';
import 'CriarJson.dart';

String dataAgora() {
  final now = DateTime.now();
  final DataAgoraDia = now.day;
  final DataAgoraMes = now.month;
  final DataAgoraAno = now.year;
  final DataAgoraHora = now.minute;

  return '$DataAgoraDia/$DataAgoraMes/$DataAgoraAno';
}

RankJson position1 = new RankJson();
RankJson position2 = new RankJson();
RankJson position3 = new RankJson();
RankJson position4 = new RankJson();
RankJson position5 = new RankJson();

class Ranking extends StatefulWidget {
  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    rank();
  }

  void rank() async {
    RankJson ranks = await getRank();
    print(ranks);
    if (ranks.position == 0) {
      position1 = ranks;
      position2 = ranks;
      position3 = ranks;
      position4 = ranks;
      position5 = ranks;
    }
    if (ranks.position == 1) {
      position1 = ranks;
    }
    if (ranks.position == 2) {
      position2 = ranks;
    }
    if (ranks.position == 3) {
      position3 = ranks;
    }
    if (ranks.position == 4) {
      position4 = ranks;
    }
    if (ranks.position == 5) {
      position5 = ranks;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF008F8C),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('img/ranking.png'),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80.0,
                ),
                Center(child: NomeCampos('PONTOS')),
                SizedBox(
                  width: 15.0,
                ),
                Center(child: NomeCampos('LEVEL')),
                SizedBox(
                  width: 20.0,
                ),
                Center(child: NomeCampos('TEMPO')),
                SizedBox(
                  width: 25.0,
                ),
                Center(child: NomeCampos('DATA')),
                SizedBox(
                  width: 35.0,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(child: _linhas(position1)),
                Center(child: _linhas(position2)),
                Center(child: _linhas(position3)),
                Center(child: _linhas(position4)),
                Center(child: _linhas(position5)),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
                child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ));
              },
              child: Text('voltar', style: TextStyle(color: Colors.black)),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                  minimumSize: MaterialStateProperty.all(Size(100, 40)),
                  overlayColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 204, 204, 204)),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255))),
            )),
          ],
        ),
      ),
    );
  }

  Row _linhas(RankJson teste) {
    if (teste.position == null) {
      return Row(
        children: [
          Center(
              child: Center(
                  child: CircularProgressIndicator(color: Colors.black87)))
        ],
      );
    } else {
      return linhas(
          teste.position.toString(),
          teste.pontos.toString(),
          teste.level.toString(),
          teste.tempo.toString(),
          teste.date.toString(),
          false);
    }
  }

  Container NomeCampos(String nome) {
    return Container(
      child: Text(
        nome,
        style: TextStyle(
            fontSize: 14.0,
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
    );
  }

  Row linhas(String position, String Pontos, String levels, String Tempo,
      String date, bool cor) {
    int cors = 255;
    if (cor) cors = 100;

    return Row(children: [Text("TESTE"), Text("TESTE"), Text("TESTE")]);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(4),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.black,
            ),
            shape: BoxShape.circle,
            color: Color.fromRGBO(255, 255, cors, 1.0),
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
          ),
          child: Center(
              child: Text(
            position,
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 30, shadows: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                offset: Offset(
                  1.0, // Move to right 10  horizontally
                  3.0, // Move to bottom 10 Vertically
                ), // soften the shadow
              )
            ]),
          )),
        ),
        ContainerLinhas(Pontos),
        ContainerLinhas(levels),
        ContainerLinhas(Tempo),
        ContainerLinhas(date),
      ],
    );
  }

  Container ContainerLinhas(String valor) {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
      child: Text(valor),
    );
  }
}
