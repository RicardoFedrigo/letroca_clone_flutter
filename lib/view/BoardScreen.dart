import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String> _words = [
    'a',
    'b',
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        GridView.builder(
          // physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 2.0,
          ),
          itemCount: this._words.length,
          itemBuilder: (context, index) {
            return OutlinedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey;
                    }
                    return Colors.blue;
                  }),
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }
                    return Colors.transparent;
                  }),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                          bottom: Radius.circular(10)))),
                ),
                child: Text(this._words[index]));
          },
        ),
        GridView.builder(
          padding: EdgeInsets.only(top: 20),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 2.0,
          ),
          itemCount: this._words.length,
          itemBuilder: (context, index) {
            return OutlinedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey;
                    }
                    return Colors.blue;
                  }),
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }
                    return Colors.transparent;
                  }),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                          bottom: Radius.circular(10)))),
                ),
                child: Text(this._words[index]));
          },
        ),
      ],
    ));
  }
}
