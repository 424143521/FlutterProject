import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PiePage2.dart';



class Page4 extends StatelessWidget {
  Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("付费游戏评价占比"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: 600,height:600,child: new AnalysisCustomerPage()),

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
