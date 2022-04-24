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
        child: Row(
            children: List.generate(
                this._wordToDiscover.length,
                (index) => Container(
                      margin: const EdgeInsets.all(3.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: Colors.white,
                          ),
                      alignment: Alignment.center,
                      child:  this._wordToDiscover.isFound
                          ? Text(this._wordToDiscover.getLetter(index),
                              style: TextStyle(
                                height: 0.8,
                                fontSize: 18,
                              ))
                          : SizedBox(
                              height: 11.0,
                              width: 11.0,
                            ),
                    ))));
  }
}