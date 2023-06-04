import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PiePage2.dart';
import 'PiePage3.dart';


class Page5 extends StatelessWidget {
  Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("免费游戏评价占比"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: 600,height:600,child: new AnalysisCustomerPage2()),

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
