import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/providers/refinancing_rate_provider.dart';
import 'package:currency_rates/colors.dart';
import 'package:provider/provider.dart';
import 'package:currency_rates/common/format_date.dart';
import 'custom_graph.dart';
import 'general_list_tile.dart';

class RefinancingRateList extends StatefulWidget {
  @override
  State<RefinancingRateList> createState() => _RefinancingRateListState();
}

class _RefinancingRateListState extends State<RefinancingRateList> {
  @override
  Widget build(BuildContext context) {
    RefinancingRateProvider _refinancingRateState =
        Provider.of<RefinancingRateProvider>(context);

    // print('_refinancingRateState.getFullRefRateList ${_refinancingRateState.getFullRefRateList}');
    return Stack(
        children: _refinancingRateState.isRequestIsUnsuccessful
            ? [
                ListView(
                  children: const [
                    DummyRefinancingRate(),
                  ],
                ),
                Positioned.fill(
                    child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            _refinancingRateState.errorDescrForCustomer,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                // color: CustomColors.primaryGray,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                  ),
                ))
              ]
            : [
                ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    GeneralListTile(
                      titleText: FormatDate(
                          _refinancingRateState.getCurrentRefRate.Date),
                      subtitleText: 'Date of last changes',
                      leadingIcon: 'assets/percent.svg',
                      leadingIconBgColor: CustomColors.lightPurple,
                      leadingIconColor: CustomColors.deepPurple,
                      trailingValue:
                          '${_refinancingRateState.getCurrentRefRate.Value}%',
                      trailingSubText: '-',
                      currancyGraph:
                          _refinancingRateState.isRequestIsUnsuccessful
                              ? const Text('Graph of dynamics is unavailable',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: CustomColors.primaryGray,
                                  ))
                              : CustomGraph(
                                  graphData: _refinancingRateState
                                      .getFullRefRateList as List<Dynamics>,
                                  graphWidth: 95,
                                  titleText: '',
                                  graphName: 'Refinance rate dynamics',
                                  lineColor: CustomColors.deepOrange,
                                  primaryXAxisIsVisible: false,
                                  primaryYAxisIsVisible: false,
                                ),
                    ),
                  ],
                ),
              ]);
  }
}

class DummyRefinancingRate extends StatelessWidget {
  const DummyRefinancingRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GeneralListTile(
      titleText: '---',
      subtitleText: 'Date of last changes',
      symbolsInsteadOfIcon: true,
      leadingIcon: '-',
      trailingValue: '___%',
      trailingSubText: '-',
    );
  }
}
