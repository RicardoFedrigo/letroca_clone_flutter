import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextLevelButton extends StatelessWidget {
  final Function _nextLevel;
  const NextLevelButton(Function nextLevel) : _nextLevel = nextLevel;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          this._nextLevel();
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
