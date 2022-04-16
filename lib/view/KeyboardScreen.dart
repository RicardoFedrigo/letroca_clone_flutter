import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyboardScreen extends StatefulWidget {
  const KeyboardScreen({Key? key}) : super(key: key);

  @override
  State<KeyboardScreen> createState() => _KeyboardScreenState();
}

class _KeyboardScreenState extends State<KeyboardScreen> {
  _KeyboardScreenState() {
    for (var i = 0; i < 8; i++) {
      this._lettersToFormWords.add(" ");
    }
  }

  void selectLetter(String letter) {
    setState(() {
      this._lettersToFormWords[this._lettersToFormWords.indexOf(" ")] = letter;
    });
  }

  void clearLetter() {
    List<String> empetyLetter =
        this._lettersToFormWords.map((element) => " ").toList();
    print(empetyLetter);
    setState(() {
      this._lettersToFormWords = empetyLetter;
    });
  }

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

  List<String> _lettersToFormWords = [];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        GridView.builder(
            padding: EdgeInsets.only(top: 20),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: this._lettersToFormWords.length < 10
                  ? this._lettersToFormWords.length
                  : 10,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: this._lettersToFormWords.length,
            itemBuilder: (context, index) {
              return Container(
                child: SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 7,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(this._lettersToFormWords[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.black))),
                ),
              );
            }),
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
                onPressed: () {
                  this.selectLetter(this._words[index]);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.white;
                    }
                    return Colors.white;
                  }),
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.amber;
                    }
                    return Colors.transparent;
                  }),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                          bottom: Radius.circular(10)))),
                ),
                child: Text(
                  this._words[index],
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ));
          },
        ),
        OutlinedButton(
            onPressed: () {
              this.clearLetter();
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith<Color>((states) {
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
              "CLear",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ))
      ],
    ));
  }
}
