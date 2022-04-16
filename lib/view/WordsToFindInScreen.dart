import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordsToFindInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
          child: const DecoratedBox(
            decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 237, 138)),
          ),
        )
      );
  }
}
