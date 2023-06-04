import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GameCompare.dart';
import 'network/http_request.dart';

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final registerFormKey = GlobalKey<FormState>();
   String gameName="";
   int sellingPrice=0;//售价
   int originalPrice=0;//原价
   String discount="";//折扣
   String detailPage="";//详情页
   String evaluation="";//评价
   String favorableRating="";//好评率
   String numberOfAssessors="";//好评人数
  // 游戏名  Cities: Skylines
  void registerForm() {
    registerFormKey.currentState?.save();
    print(gameName);
    HttpRequestTest.request("http://112.125.95.197:5000/find/游戏="+gameName).then((res){
      print("我的首发式地方"+res.toString());
      for(var sub in res){
        //"Counter-Strike: Global Offensive
        String originalPrice1 = sub[1].toString();
        String sellingPrice1 = sub[2].toString();
        //售价 折扣 详情页 评价 好评率 评价人数
         discount = sub[3].toString();
         detailPage = sub[4].toString();
         evaluation = sub[5].toString();
         favorableRating = sub[6].toString();
         numberOfAssessors = sub[7].toString();

         if(originalPrice1.substring(4,5)=="0"){
           originalPrice = 0;
         }else{
        originalPrice= int.parse( originalPrice1.substring(3,originalPrice1.length-3).trim());
           print(originalPrice1);
           print(originalPrice1.substring(4,5));
         }
         sellingPrice = 0;
        if(sellingPrice1.substring(4,5)=="0"){
          sellingPrice = 0;
        }else{
          sellingPrice= int.parse( sellingPrice1.substring(3,sellingPrice1.length-3).trim());

        }
setState(() {

});      }
      // print(res[2].toString());
    });
    // print("username:$username ");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Form(
      key: registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.search),
                labelText: "输入游戏名称，查看信息"
            ),
            onSaved: (value) {
              this.gameName = value!;
            },
          ),
          OutlinedButton(
            onPressed: registerForm,
            child: const Text("搜索"),
          ),
          GameCompare(originalPrice,sellingPrice),
          Column(
            children: [
              Text("游戏名"+gameName),
              Text("原价"+originalPrice.toString()),
              Text("现价"+sellingPrice.toString()),
              Text("折扣"+discount),
              Text("详情页"+detailPage),
              Text("评价"+evaluation),
              Text("好评率"+favorableRating),
              Text("好评人数"+numberOfAssessors),
            ],
          )

        ],
      ),
    );
  }
}