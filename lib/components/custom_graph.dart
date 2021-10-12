import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:currency_rates/common/format_date.dart';

class CustomGraph extends StatefulWidget {
  final List<Dynamics>? graphData;
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
          enableAxisAnimation: true,
          // borderColor: Colors.red,
          plotAreaBorderColor: widget.graphBorderColor ?? Colors.transparent,
          title: ChartTitle(
              text: widget.titleText ?? '',
          ),
          primaryXAxis: CategoryAxis(
            isVisible: widget.primaryXAxisIsVisible,
            labelRotation: 90,
              visibleMinimum: 5,
              maximumLabels: 5
          ),
          primaryYAxis: NumericAxis(
            isVisible: widget.primaryYAxisIsVisible,
          ),
          legend: Legend(isVisible: false),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<Dynamics, String>>[
            LineSeries<Dynamics, String>(
                dataSource: widget.graphData ?? [],
                color: widget.lineColor,
                xValueMapper: (Dynamics rates, _) => FormatDateShortView(rates.Date),
                yValueMapper: (Dynamics rates, _) => rates.Cur_OfficialRate ?? rates.Value,
                name: widget.graphName ?? 'dynamics',
                dataLabelSettings: DataLabelSettings(isVisible: false))
          ]),
    );
  }
}
