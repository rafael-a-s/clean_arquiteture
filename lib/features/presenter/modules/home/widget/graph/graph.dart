import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class GraphHome extends StatefulWidget {
  const GraphHome({super.key});

  @override
  State<GraphHome> createState() => _GraphHomeState();
}

class _GraphHomeState extends State<GraphHome> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 36),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 50,
          interval: 10,
          labelFormat: '{value}\$',
        ),
        series: <ChartSeries<_SalesData, String>>[
          LineSeries<_SalesData, String>(
            color: Colors.blue,
            dataSource: data,
            xValueMapper: (data, index) => data.year,
            yValueMapper: (data, index) => data.sales,
            markerSettings: MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              borderWidth: 2,
              borderColor: Colors.white,
            ),
            animationDuration: 1000,
            dataLabelSettings: const DataLabelSettings(
              isVisible: false,
            ),
            trendlines: <Trendline>[
              Trendline(
                type: TrendlineType.movingAverage,
                width: 2,
                color: Colors.red,
                opacity: 0.5,
                period: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
