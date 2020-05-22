/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  factory SimpleBarChart.withSampleData2() {
    return new SimpleBarChart(
      _createSampleData2(),
      // Disable animations for image tests.
      animate: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
        seriesList,
        animate: animate,
      );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('DOM', 15),
      new OrdinalSales('SEG', 25),
      new OrdinalSales('TER', 40),
      new OrdinalSales('QUA', 35),
      new OrdinalSales('QUI', 37),
      new OrdinalSales('SEX', 33),
      new OrdinalSales('SAB', 26),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.Color.fromHex(code: "#55e890"),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData2() {
    final data = [
      new OrdinalSales('DOM', 26),
      new OrdinalSales('SEG', 37),
      new OrdinalSales('TER', 33),
      new OrdinalSales('QUA', 29),
      new OrdinalSales('QUI', 32),
      new OrdinalSales('SEX', 29),
      new OrdinalSales('SAB', 15),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.Color.fromHex(code: "#55e890"),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}