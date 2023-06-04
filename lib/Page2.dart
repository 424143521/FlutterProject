import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/PiePage.dart';

import 'network/http_request.dart';



class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("游戏价格占比"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              '游戏价格占比',
            ),
            Container(height:500,child: PiePage()),


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
