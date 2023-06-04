import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'models/game_star.dart';
import 'network/http_request.dart';




class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class HotGame extends StatefulWidget {
  const HotGame({Key? key}) : super(key: key);

  @override
  State<HotGame> createState() => _HotGameState();
}

class _HotGameState extends State<HotGame> {
  List<GameItem> games=[];
   List<OrdinalSales> data=[
  OrdinalSales("",0),
  OrdinalSales("",0),
  OrdinalSales("",0),
  OrdinalSales("",0),

  /* OrdinalSales("games[0].name.substring(0,5)",121),
      OrdinalSales("games[0].name.substring(0,5)",121),
      OrdinalSales("games[0].name.substring(0,5)",121),
      OrdinalSales("games[0].name.substring(0,5)",121),
      OrdinalSales("games[0].name.substring(0,5)",121),*/

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HttpRequestTest.request("http://112.125.95.197:5000/hot").then((res){
      final subjects = res[0];
      print(subjects.toString());
      games = [];

      for(var sub in res){
        //
        var game = GameItem(sub[0],toNumber(sub[7]));

         games.add(game);
      }
       data = [
        OrdinalSales(games[0].name.substring(0,5),games[0].start),
        OrdinalSales(games[1].name.substring(0,5),games[1].start),
        OrdinalSales(games[2].name.substring(0,5),games[2].start),
        OrdinalSales(games[3].name.substring(0,5),games[3].start),
        OrdinalSales(games[4].name.substring(0,5),games[4].start),
        /* OrdinalSales("games[0].name.substring(0,5)",121),
      OrdinalSales("games[0].name.substring(0,5)",121),
      OrdinalSales("games[0].name.substring(0,5)",121),
      OrdinalSales("games[0].name.substring(0,5)",121),
      OrdinalSales("games[0].name.substring(0,5)",121),*/

      ];
      setState(() {

      });
      for (var value in games) {
        print(value.name+"喜爱数"+value.start.toString());
      }
    });
  }

  int toNumber(String value) {
    var split = value.split(",");
    var s = int.parse(split[0])*1000000+int.parse(split[1])*1000+int.parse(split[2]);
    return s;
  }


  @override
  Widget build(BuildContext context) {
    return Column(children: [Text("玩家喜爱游戏 Top5"), Container(height: 240, child: _simpleBar()), SizedBox(
      height:30,
    ),]);

  }
  Widget _simpleBar() {




    var seriesList = [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];

    return charts.BarChart(
      seriesList,
      animate: true,
      // barGroupingType: charts.BarGroupingType.stacked,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
    );
  }

}