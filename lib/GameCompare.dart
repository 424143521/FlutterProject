import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GameCompare extends StatelessWidget {
   GameCompare(this.originalPrice
   ,this.sellingPrice,{Key? key}) : super(key: key);
 int originalPrice;
 int sellingPrice;

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text("价格对比"), Container(height: 240, child: _simpleBar()),Text("评价人数")]);
  }

  Widget _simpleBar() {

    var data = [
      OrdinalSales('原价', originalPrice),
      OrdinalSales('现价',sellingPrice),

    ];

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
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
