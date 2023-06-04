import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'ButtonToPage.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'Page4.dart';
import 'Page5.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("CODERWHY"),
          ),
          body:MyHomePage(title: "title")
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;



  @override
  Widget build(BuildContext context) {


    return new  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 10),
                child:ButtonToPage((){
                  Navigator.push(context as BuildContext, MaterialPageRoute(builder:(context) => Page1()));
                },"玩家喜爱Top5") ,
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 10),
                child:ButtonToPage((){
                  Navigator.push(context as BuildContext, MaterialPageRoute(builder:(context) => Page2()));
                },"游戏价格占比") ,
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 10),
                child:ButtonToPage((){
                  Navigator.push(context as BuildContext, MaterialPageRoute(builder:(context) => Page3()));
                },"游戏信息查询") ,
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 10),
                child:ButtonToPage((){
                  Navigator.push(context as BuildContext, MaterialPageRoute(builder:(context) => Page4()));
                },"付费游戏评价占比") ,
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 10),
                child:ButtonToPage((){
                  Navigator.push(context as BuildContext, MaterialPageRoute(builder:(context) => Page5()));
                },"免费游戏评价占比") ,
              ),

            ],
          ),
        )

      // ListView(
      //     children:<Widget>[
      //       HomeBody(),
      //       Container(child: piePage(),width: 200,height: 400,),
      //       Column(
      //
      //         children: [
      //          FormDemo()
      //         ],
      //       )
      //     ]
      // ),
    );
  }
}