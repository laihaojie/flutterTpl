import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartPage1 extends StatefulWidget {
  @override
  _ChartPage1State createState() => _ChartPage1State();
}

class _ChartPage1State extends State<ChartPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chart'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: getLine(),
            )
          ],
        ),
      ),
    );
  }

  Widget getLine() {
    List<Linesales> dataLine = [
      Linesales(DateTime(2019, 7, 2), 33),
      Linesales(DateTime(2019, 7, 3), 55),
      Linesales(DateTime(2019, 7, 4), 22),
      Linesales(DateTime(2019, 7, 5), 88),
      Linesales(DateTime(2019, 7, 6), 123),
      Linesales(DateTime(2019, 7, 7), 75),
    ];

    var seriesLine = [
      charts.Series<Linesales, DateTime>(
        data: dataLine,
        domainFn: (Linesales lines, _) => lines.time,
        measureFn: (Linesales lines, _) => lines.sale,
        id: "Lines",
      ),
      charts.Series<Linesales, DateTime>(
        data: dataLine,
        domainFn: (Linesales lines, _) => lines.time,
        measureFn: (Linesales lines, _) => lines.sale,
        id: "Lines1",
      ),
    ];
    //是TimeSeriesChart，而不是LineChart,因为x轴是DataTime类
    Widget line = charts.TimeSeriesChart(seriesLine);
    //line = charts.LineChart(series);
    return line;
  }
}

class Barsales {
  String day;
  int sale;
  Barsales(this.day, this.sale);
}

class Linesales {
  DateTime time;
  int sale;
  Linesales(this.time, this.sale);
}
