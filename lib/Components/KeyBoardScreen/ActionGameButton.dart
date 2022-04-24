import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionGameButton extends StatelessWidget {
  final Function action;
  final String text;

  ActionGameButton({required Function this.action,required String this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          this.action();
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
          text,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }
}
