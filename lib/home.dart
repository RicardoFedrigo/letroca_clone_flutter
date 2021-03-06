import 'package:flutter/material.dart';
import 'package:letroca_clone_flutter/view/ScreenFinalGame.dart';
import 'package:letroca_clone_flutter/view/ScreenProxLevel.dart';
import 'Modules/GameLogic/GameLogic.dart';
import 'Ranking.dart';
import 'view/GameScreen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF008F8C),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('img/logo.png'),
              SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                new GameScreen(new GameLogic()),
                          ));
                    },
                    child: Text('START', style: TextStyle(color: Colors.black)),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
                    child:
                        Text('RANKING', style: TextStyle(color: Colors.black)),
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
      ),
    );
  }
}
