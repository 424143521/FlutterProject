import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/FormDemo.dart';

class Page3 extends StatelessWidget {
  Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("游戏信息查询"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              '游戏信息查询',
            ),
            FormDemo()
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
