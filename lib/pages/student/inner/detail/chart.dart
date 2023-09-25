import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final List<ChartData> chartData = [
  ChartData(10, [5.5, 0.6]),
  ChartData(20, [2.5, 0.6]),
  ChartData(30, [1.5, 0.6]),
  ChartData(40, [0.5, 0.6]),
  ChartData(50, [0.5, 3.6]),
  ChartData(60, [0.5, 2.6]),
  ChartData(70, [0.5, 1.6]),
  ChartData(80, [0.5, 0.63]),
  ChartData(90, [0.5, 0.126]),
];

class ChartData {
  ChartData(this.x, this.y);

  final int x;
  final List? y;
}

List<SplineSeries> generateSplineSeries(List<ChartData> chartData) {
  List<SplineSeries> splines = [];
  splines.add(SplineSeries<ChartData, int>(
    dataSource: chartData,
    xValueMapper: (ChartData data, _) => data.x,
    yValueMapper: (ChartData data, _) => data.y![0],
  ));
  return splines;
}

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SfCartesianChart(
        series: generateSplineSeries(chartData),
      ),
    );
  }
}
