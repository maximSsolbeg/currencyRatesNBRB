import 'package:flutter/material.dart';
import 'package:currency_rates/components/settings_drawer.dart';
import 'package:currency_rates/colors.dart' ;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class UsdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'USD details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          )
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0XFFCCD1E0)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: CustomColors.secondaryGray),
      ),
      body: UsdPageBody(),
      endDrawer: const SettingsDrawer(),
    );
  }
}

class UsdPageBody extends StatefulWidget {
  @override
  State<UsdPageBody> createState() => _UsdPageBodyState();
}

class _UsdPageBodyState extends State<UsdPageBody> {
  List<_UsdDynamics> data = [
    _UsdDynamics(145, '07.08.19', 2.0526),
    _UsdDynamics(145, '08.08.19', 2.0563),
    _UsdDynamics(145, '09.08.19', 2.0567),
    _UsdDynamics(145, '10.08.19', 2.0857),
    _UsdDynamics(145, '11.08.19', 2.0125),
    _UsdDynamics(145, '12.08.19', 2.1564),
    _UsdDynamics(145, '13.08.19', 2.0845),
  ];

  String reformatDate(date) {
    DateTime parseDt = DateTime.parse(date);
    var newFormat = DateFormat('dd.MM.yy');
    String updatedDt = newFormat.format(parseDt);

    return updatedDt;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Динамика курса BYN по отношению к USD'),
            // Enable legend
            legend: Legend(isVisible: false),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_UsdDynamics, String>>[
              LineSeries<_UsdDynamics, String>(
                  dataSource: data,
                  xValueMapper: (_UsdDynamics rates, _) {
                    return rates.Date;
                  },
                  yValueMapper: (_UsdDynamics rates, _) => rates.Cur_OfficialRate,
                  name: 'Sales',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: false))
            ]),
        ],
      ),
    );
  }
}

class _UsdDynamics {
  _UsdDynamics(this.Cur_ID, this.Date, this.Cur_OfficialRate);

  final int Cur_ID;
  final String Date;
  final double Cur_OfficialRate;
}
