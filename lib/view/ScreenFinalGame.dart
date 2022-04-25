import 'package:flutter/material.dart';
import 'package:letroca_clone_flutter/Ranking.dart';

class finalGame extends StatelessWidget {
  const finalGame({Key? key}) : super(key: key);

  final int level = 2;

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
                    child: Text('3'),
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
                    child: Text('1050'),
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
                    child: Text('03:00'),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('NOVA PARTIDA',
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
                        padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
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
