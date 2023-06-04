import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'network/http_request.dart';


class PieSales {
  final int year;
  final int sales;
  final charts.Color color;
  PieSales(this.year, this.sales, this.color);




}



/*
*  */
//  Widget _Pie(int freeGame,int game_30_50,int game_50_100,int game_100_150,int game_150_300 ,int game_300_1000 ) {



class PiePage extends StatefulWidget {

  @override
  _AnalysisCustomerPageState createState() => _AnalysisCustomerPageState();


}

class _AnalysisCustomerPageState extends State<PiePage> {


   int freeGame=0;
  late int game_30_50;
  late int game_50_100;
  late int game_100_150;
  late int game_150_300;
  late int game_300_10000;
   int game_size=0;
   int size=0;
  List<ChartData> customerData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    HttpRequestTest.request("http://112.125.95.197:5000/size").then((res){

      size = res;
      setState(() {

      });
    });
    HttpRequestTest.request("http://112.125.95.197:5000/price_zhan_bi/type=Price,begin=0,end=0").then((res){
      freeGame=res;
      setState(() {

      });
    });
    HttpRequestTest.request("http://112.125.95.197:5000/price_zhan_bi/type=Price,begin=30,end=50").then((res){
      game_30_50=res;

      setState(() {

      });
    });
    HttpRequestTest.request("http://112.125.95.197:5000/price_zhan_bi/type=Price,begin=50,end=100").then((res){
      game_50_100=res;
      setState(() {

      });

    });
    HttpRequestTest.request("http://112.125.95.197:5000/price_zhan_bi/type=Price,begin=100,end=150").then((res){

      setState(() {
        game_100_150 = res;
      });
    });
    HttpRequestTest.request("http://112.125.95.197:5000/price_zhan_bi/type=Price,begin=150,end=300").then((res){
      setState(() {
        game_150_300 = res;

      });


    });
    HttpRequestTest.request("http://112.125.95.197:5000/price_zhan_bi/type=Price,begin=300,end=1000").then((res){

      setState(() {
        game_300_10000 = res;
      });
    });



  }
  _played(){
  setState(() {
    game_size = game_30_50+game_50_100+game_100_150+game_150_300+game_300_10000;
  // customerData.add(ChartData('freeGame', 1,Colors.purpleAccent, rate: freeGame/game_size));
  customerData.add(ChartData('30_50￥', 4,Colors.cyanAccent, rate: game_30_50/game_size));
  customerData.add(ChartData('50_100￥', 5,Colors.yellow, rate: game_50_100/game_size));
  customerData.add(ChartData('100_150￥', 3,Colors.red, rate: game_100_150/game_size));
  customerData.add(ChartData('150_300￥', 2,Colors.blue, rate: game_150_300/game_size));
  customerData.add(ChartData('300_10000￥', 1,Colors.green, rate: game_300_10000/game_size));

  });
}

  @override
  Widget build(BuildContext context) {
    print("免费游戏"+freeGame.toString());

    // TODO: implement build
    return ListView(
      children: [
        Container(
          height: 350,
          child: SfCircularChart(
            // 显示图例，position显示所在位置
            legend: Legend(isVisible: true, position: LegendPosition.right),
            series: <CircularSeries>[
              PieSeries<ChartData, String>(
                dataSource: customerData,
                // 数据块颜色
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                // 显示数据
                dataLabelMapper: (ChartData data, _) =>
                (data.rate * 100).toInt().toString() + '%',
                // 显示数据标签
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
        OutlinedButton(
          onPressed: _played,
          child: const Text("搜索"),
        ),
        Center(
          child: Column(
            children: [
              Text("游戏总数"+size.toString()),
              Text("免费游戏的数量"+freeGame.toString()),
              Text("付费游戏的数量"+(size-freeGame).toString()),
            ],
          ),
        ),


      ],
    );
  }

}

class ChartData {
  ChartData(this.x, this.y, this.color, { required this.rate});

  final String x;
  final double y;
  final double rate;
  final Color color;
}