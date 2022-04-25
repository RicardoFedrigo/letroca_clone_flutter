import 'package:flutter/material.dart';
import 'package:letroca_clone_flutter/view/GameScreen.dart';

import '../Modules/GameLogic/GameLogic.dart';
import '../view/ScreenProxLevel.dart';

class NextLevelButton extends StatelessWidget {
  final GameLogic _gameLogic;
  const NextLevelButton(this._gameLogic);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenProxLevel(_gameLogic),
              )
            );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.white;
            }
            return Colors.white;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.amber;
            }
            return Colors.transparent;
          }),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10), bottom: Radius.circular(10)))),
        ),
        child: Text(
          "Next Level",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }
}
