import 'package:flutter/material.dart';
import 'package:currency_rates/providers/refinancing_rate_provider.dart';
import 'package:currency_rates/providers/refinancing_rate_provider.dart';
import 'package:currency_rates/colors.dart' ;
import 'package:provider/provider.dart';
import 'package:currency_rates/common/format_date.dart';
import 'custom_graph.dart';
import 'general_list_tile.dart';

class RefinancingRateList extends StatefulWidget{
  @override
  State<RefinancingRateList> createState() => _RefinancingRateListState();
}

class _RefinancingRateListState extends State<RefinancingRateList> {

  //TODO: replace with ref rate data
  // List<CurrencyDynamics> refinancingGraphData = [
  //   CurrencyDynamics(145, '07.08.19', 5.5),
  //   CurrencyDynamics(145, '08.08.19', 6.5),
  //   CurrencyDynamics(145, '09.08.19', 7.8),
  //   CurrencyDynamics(145, '10.08.19', 8.25),
  //   CurrencyDynamics(145, '11.08.19', 6.25),
  //   CurrencyDynamics(145, '12.08.19', 9.25),
  // ];

  @override
  Widget build(BuildContext context){
    RefinancingRateProvider _refinancingRateState = Provider.of<RefinancingRateProvider>(context);
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        GeneralListTile(
          titleText: FormatDate(_refinancingRateState.getCurrentRefRate.Date),
          subtitleText: 'Date of last changes',
          leadingIcon: 'assets/percent.svg',
          leadingIconBgColor: CustomColors.lightPurple,
          leadingIconColor: CustomColors.deepPurple,
          trailingValue: '${_refinancingRateState.getCurrentRefRate.Value}%',
          trailingSubText: '-',
          currancyGraph: CustomGraph(
            // graphData: refinancingGraphData,
            graphWidth: 95,
            titleText: '',
            graphName: 'Refinancing rate dynamics',
            lineColor: CustomColors.deepPurple,
            primaryXAxisIsVisible: false,
            primaryYAxisIsVisible: false,
          ),
        ),
      ],
    );
  }
}
