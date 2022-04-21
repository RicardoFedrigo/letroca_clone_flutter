import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'GameScreen.dart';

class PlayerName extends StatelessWidget {
  const PlayerName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Player Name'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Player name",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              SizedBox(
                child: TextFormField(
                  controller: myController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                  ),
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                  onFieldSubmitted: (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameScreen(
                             myController.text,
                          ),
                        ));
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  GameScreen(""),
                      ));
                },
                child: Text('START'),
              ),
            ]),
      ),
    );
  }
}
