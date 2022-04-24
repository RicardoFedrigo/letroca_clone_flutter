import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LevelProgress extends StatefulWidget {
  const LevelProgress({ Key? key }) : super(key: key);

  @override
  State<LevelProgress> createState() => _LevelProgressState();
}

class _LevelProgressState extends State<LevelProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:38),
        child: Center(
          child: LinearProgressIndicator(
            backgroundColor: Colors.red,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),

          ),
        ),
      ),
    );
  }
}