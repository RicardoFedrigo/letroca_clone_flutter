import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Modules/GameLogic/Word.dart';

class WordToDiscover extends StatefulWidget {
  Word word;
  WordToDiscover(this.word);

  @override
  State<WordToDiscover> createState() => _WordToDiscoverState(word);
}

class _WordToDiscoverState extends State<WordToDiscover> {
  Word _wordToDiscover;

  _WordToDiscoverState(Word this._wordToDiscover);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          padding: EdgeInsets.only(top: 20),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: this._wordToDiscover.length < 10
                ? this._wordToDiscover.length
                : 10,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 2.0,
          ),
          itemCount: this._wordToDiscover.length,
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
                    child: Text(this._wordToDiscover.letter(index),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ))),
              ),
            );
          }),
    );
  }
}
