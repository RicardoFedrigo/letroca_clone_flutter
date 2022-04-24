import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointsCount extends StatefulWidget {
  int _points;
  PointsCount(int points) : _points = points;

  @override
  State<PointsCount> createState() => _PointsCountState(_points);
}

class _PointsCountState extends State<PointsCount> {
  late int _points;

  _PointsCountState(int points) {
    
    print({"points":points});
    _points = points;
  }

  //! ver pq essa bosta não esta funcionando

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Text(
        "$_points",
        style: TextStyle(fontSize: 25, color: Colors.black),
      ),
    );
  }
}
