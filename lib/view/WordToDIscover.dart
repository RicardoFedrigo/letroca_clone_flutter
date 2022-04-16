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
      child:  GridView.builder(
          padding: EdgeInsets.only(top: 20),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 2.0,
          ),
          itemCount: this._wordToDiscover.word.length,
          itemBuilder: (context, index) {
            return OutlinedButton(
                onPressed: null,
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
                  this._wordToDiscover.word[index],
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ));
          },
        ),
    );
  }
}