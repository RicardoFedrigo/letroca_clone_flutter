import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letroca_clone_flutter/Components/KeyBoardScreen/ActionGameButton.dart';

class KeyboardScreen extends StatefulWidget {
  List<String> _lettersInWord;
   final Function _verifyWord;

  KeyboardScreen(this._lettersInWord,this._verifyWord);

  @override
  State<KeyboardScreen> createState() =>
      _KeyboardScreenState(this._lettersInWord,this._verifyWord);
}

class _KeyboardScreenState extends State<KeyboardScreen> {
  List<String> _words;
  final Function _verifyWord;
  _KeyboardScreenState(this._words,this._verifyWord) {
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
    setState(() {
      this._lettersToFormWords = empetyLetter;
    });
  }

  void verifyWord() {
    this._verifyWord(this._lettersToFormWords.join());
  }

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
              crossAxisCount: this._lettersToFormWords.length,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: this._lettersToFormWords.length,
            itemBuilder: (context, index) {
              return Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(this._lettersToFormWords[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ))),
                ),
              );
            }),
        GridView.builder(
          padding: EdgeInsets.only(top: 20),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: this._lettersToFormWords.length,
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
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ));
          },
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ActionGameButton(
              action: this.clearLetter,
              text: "Clear",
            ),
            ActionGameButton(
              action: this.verifyWord,
              text: "Verify",
            )
          ]),
        ),
      ],
    ));
  }
}
