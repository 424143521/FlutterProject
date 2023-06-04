import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'MyApp.dart';
import 'Page1.dart';

class ButtonToPage extends StatefulWidget {
   ButtonToPage(this.param0,this.param1 ,{Key? key}) : super(key: key);
   Null Function()  param0 ;
   String  param1 ;
  @override
  State<ButtonToPage> createState() => _ButtonToPageState(param0,param1);
}

class _ButtonToPageState extends State<ButtonToPage> {
  _ButtonToPageState(this.param0, this.param1);
  Null Function()  param0 ;
  String  param1 ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(
      elevation: 2,
      padding: const EdgeInsets.all(12.0),
//圆角
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
      onPressed: param0,
      child: Text(
        param1,
        style: TextStyle(color: Colors.white),
      ),);
  }
}
/*
ElevatedButton(
style: ElevatedButton.styleFrom(
elevation: 2,
padding: const EdgeInsets.all(12.0),
//圆角
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15.0),
),
),
onPressed: () {
Navigator.push(context as BuildContext, MaterialPageRoute(builder:(context) => MyApp()));
},
child: Text(
"功能一",
style: TextStyle(color: Colors.white),
),
)*/
