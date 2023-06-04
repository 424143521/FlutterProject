import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HotGame.dart';
import 'GameCompare.dart';

class Page1 extends StatelessWidget {
   Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("玩家喜爱Top5"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            HotGame()

          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
      },
        tooltip: 'Increment',
        child: new Icon(Icons.restart_alt),
      ),
    );

  }


}
