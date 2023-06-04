import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class AnalysisCustomerPage2 extends StatefulWidget {
  @override
  _AnalysisCustomerPageState createState() => _AnalysisCustomerPageState();
}

class _AnalysisCustomerPageState extends State<AnalysisCustomerPage2> {

  List<ChartData> customerData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customerData.add(ChartData('特别好评', 1,Colors.teal, rate: 2/100));
    customerData.add(ChartData('好评如潮', 3,Colors.yellow, rate: 8/100));
    customerData.add(ChartData('好评', 6,Colors.blue, rate: 12/100));
    customerData.add(ChartData('多半好评', 4,Colors.green, rate: 10/100));
    customerData.add(ChartData('褒贬不一', 8,Colors.orange, rate: 28/100));
    customerData.add(ChartData('多半差评', 5,Colors.cyanAccent, rate: 15/100));
    customerData.add(ChartData('多半差评', 7,Colors.red, rate: 20/100));
    customerData.add(ChartData('差评如潮', 2,Colors.purpleAccent, rate: 5/100));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        Container(
          height: 350,
          child: SfCircularChart(
            title: ChartTitle(text: '免费游戏评价占比'),
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
        )
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