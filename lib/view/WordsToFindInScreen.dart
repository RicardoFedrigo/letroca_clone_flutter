import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordsToFindInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: GridView.count(
          crossAxisCount: 2,

          children: List.generate(100, (index) {
            return Center(
              heightFactor: 1,
              child: Text(
                'Item $index'
                ,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            );
          }),
        ),
      ),
    );
  }
}
