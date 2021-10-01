import 'package:currency_rates/models/currency_dynamics_mdl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomGraph extends StatefulWidget {
  final List<CurrencyDynamics>? graphData;
  final double? graphWidth;
  final String? titleText;
  final String? graphName;
  final Color? lineColor;
  final bool? primaryXAxisIsVisible;
  final bool? primaryYAxisIsVisible;
  final Color? graphBorderColor;

  const CustomGraph({
    Key? key,
    this.graphData,
    this.graphWidth,
    this.titleText,
    this.graphName,
    this.lineColor,
    this.primaryXAxisIsVisible,
    this.primaryYAxisIsVisible,
    this.graphBorderColor,
  }) : super(key: key);

  @override
  _CustomGraphState createState() => _CustomGraphState();
}

class _CustomGraphState extends State<CustomGraph> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: widget.graphWidth ?? double.infinity,
      child: SfCartesianChart(
          margin: EdgeInsets.zero,
          // borderColor: Colors.red,
          plotAreaBorderColor: widget.graphBorderColor ?? Colors.transparent,
          title: ChartTitle(
              text: widget.titleText ?? '',
          ),
          primaryXAxis: CategoryAxis(
            isVisible: widget.primaryXAxisIsVisible,
          ),
          primaryYAxis: NumericAxis(
            isVisible: widget.primaryYAxisIsVisible,
          ),
          legend: Legend(isVisible: false),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<CurrencyDynamics, String>>[
            LineSeries<CurrencyDynamics, String>(
                dataSource: widget.graphData ?? [],
                color: widget.lineColor,
                xValueMapper: (CurrencyDynamics rates, _) => rates.Date,
                yValueMapper: (CurrencyDynamics rates, _) => rates.Cur_OfficialRate,
                name: widget.graphName ?? 'dynamics',
                dataLabelSettings: DataLabelSettings(isVisible: false))
          ]),
    );
  }
}
