import 'package:flutter/material.dart';
import 'package:letroca_clone_flutter/view/GameScreen.dart';

import '../Modules/GameLogic/GameLogic.dart';
import 'ScreenFinalGame.dart';

class ScreenProxLevel extends StatelessWidget {
  final GameLogic _gameLogic;
  late int level = _gameLogic.actualLevel + 1;

  ScreenProxLevel(this._gameLogic);

  _nextLevel() {
    print(_gameLogic.actualLevel);
    if (_gameLogic.actualLevel < 2) {
      _gameLogic.nextLevel();
      return new GameScreen(_gameLogic);
    }

    return new ScreenFinalGame(_gameLogic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF008F8C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('img/level$level.png'),
            SizedBox(
              height: 50.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text(
                          'PONTOS',
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
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          'COMPLETO',
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
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(4, 0, 4, 4),
                      padding: EdgeInsets.fromLTRB(45, 15, 45, 15),
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
                      child: Text('${_gameLogic.getLevel().points}',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(4, 0, 4, 4),
                      padding: EdgeInsets.fromLTRB(43, 15, 43, 15),
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
                          "${(_gameLogic.getLevel().porcentageDiscovedWord() * 100).toStringAsPrecision(2)}%",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text(
                          'PONTOS TOTAL',
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
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(4, 0, 4, 4),
                      padding: EdgeInsets.fromLTRB(45, 15, 45, 15),
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
                      child: Text('${_gameLogic.totalPoints}',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(4, 0, 4, 4),
                      padding: EdgeInsets.fromLTRB(45, 15, 45, 15),
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
                      child: Text('${_gameLogic.getLevel().points}',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          maintainState: true,
                          builder: (context) => _nextLevel(),
                        ));
                  },
                  child: Text('PROXIMO LEVEL',
                      style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                      minimumSize: MaterialStateProperty.all(Size(100, 40)),
                      overlayColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 204, 204, 204)),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 255, 255))),
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
