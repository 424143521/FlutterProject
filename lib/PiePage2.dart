import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class AnalysisCustomerPage extends StatefulWidget {
  @override
  _AnalysisCustomerPageState createState() => _AnalysisCustomerPageState();
}

class _AnalysisCustomerPageState extends State<AnalysisCustomerPage> {

  List<ChartData> customerData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customerData.add(ChartData('特别好评', 7,Colors.red, rate: 7/36));
    customerData.add(ChartData('好评如潮', 6,Colors.yellow, rate: 4/36));
    customerData.add(ChartData('好评', 4,Colors.blue, rate: 5/36));
    customerData.add(ChartData('多半好评', 8,Colors.green, rate: 10/36));
    customerData.add(ChartData('褒贬不一', 5,Colors.orange, rate: 5/36));
    customerData.add(ChartData('多半差评', 2,Colors.cyanAccent, rate: 2/36));
    customerData.add(ChartData('差评如潮', 1,Colors.purpleAccent, rate: 1/36));
    customerData.add(ChartData('多半差评', 2,Colors.teal, rate: 2/36));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        Container(
          height: 350,
          child: SfCircularChart(
            title: ChartTitle(text: '付费游戏评价占比'),
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