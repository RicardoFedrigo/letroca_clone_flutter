import 'package:flutter/cupertino.dart';
import 'package:letroca_clone_flutter/view/GameScreen.dart';

class GameComponent extends StatelessWidget {
  const GameComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child:GameScreen());
  }
}
