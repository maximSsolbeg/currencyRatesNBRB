import 'package:currency_rates/common/growth.dart';
import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:currency_rates/providers/gold_dynamics_provider.dart';
import 'package:currency_rates/providers/palladium_dynamics_provider.dart';
import 'package:currency_rates/providers/platinum_dynamics_provider.dart';
import 'package:currency_rates/providers/silver_dynamics_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/providers/metals_rates_provider.dart';
import 'package:currency_rates/colors.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'custom_graph.dart';
import 'general_list_tile.dart';

class MetalsRatesList extends StatefulWidget {
  @override
  State<MetalsRatesList> createState() => _MetalsRatesListState();
}

class _MetalsRatesListState extends State<MetalsRatesList> {
  @override
  Widget build(BuildContext context) {
    MetalsRatesProvider _metalsRatesState =
        Provider.of<MetalsRatesProvider>(context);
    //TODO: delete temp usd data
    GoldDynamicsProvider _goldDynamicsState =
        Provider.of<GoldDynamicsProvider>(context);
    SilverDynamicsProvider _silverDynamicsState =
        Provider.of<SilverDynamicsProvider>(context);
    PlatinumDynamicsProvider _platinumDynamicsState =
        Provider.of<PlatinumDynamicsProvider>(context);
    PalladiumDynamicsProvider _palladiumDynamicsState =
        Provider.of<PalladiumDynamicsProvider>(context);

    return Stack(children: [
      ListView(children: [
        GeneralListTile(
          titleText: 'Gold',
          subtitleText: calcPercentageGrowth(
              dynamicsList: _goldDynamicsState.getGoldDynamicsList),
          leadingIcon: 'Au',
          leadingIconBgColor: CustomColors.saturatedGold,
          leadingIconColor: CustomColors.paleGold,
          trailingValue: '${_metalsRatesState.getGoldData.Value}',
          trailingSubText: 'BYN / 1g',
          symbolsInsteadOfIcon: true,
          currencyGraph: _goldDynamicsState.isRequestIsUnsuccessful
              ? const Text('Graph of dynamics is unavailable',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: CustomColors.primaryGray,
                  ))
              : CustomGraph(
                  graphData:
                      _goldDynamicsState.getGoldDynamicsList as List<Dynamics>,
                  graphWidth: 95,
                  titleText: '',
                  graphName: 'Gold dynamics',
                  lineColor: CustomColors.paleGold,
                  primaryXAxisIsVisible: false,
                  primaryYAxisIsVisible: false,
                ),
        ),
        GeneralListTile(
          titleText: 'Silver',
          subtitleText: calcPercentageGrowth(
              dynamicsList: _silverDynamicsState.getSilverDynamicsList),
          leadingIcon: 'Ag',
          //TODO: optimize colors for Silver icon
          // leadingIconBgColor: CustomColors.saturatedGold,
          // leadingIconColor: CustomColors.paleGold,
          trailingValue: '${_metalsRatesState.getSilverData.Value}',
          trailingSubText: 'BYN / 1g',
          symbolsInsteadOfIcon: true,
          currencyGraph: _silverDynamicsState.isRequestIsUnsuccessful
              ? const Text('Graph of dynamics is unavailable',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: CustomColors.primaryGray,
                  ))
              : CustomGraph(
                  graphData: _silverDynamicsState.getSilverDynamicsList
                      as List<Dynamics>,
                  graphWidth: 95,
                  titleText: '',
                  graphName: 'Silver dynamics',
                  lineColor: CustomColors.primaryGray,
                  primaryXAxisIsVisible: false,
                  primaryYAxisIsVisible: false,
                ),
        ),
        GeneralListTile(
          titleText: 'Platinum',
          subtitleText: calcPercentageGrowth(
              dynamicsList: _platinumDynamicsState.getPlatinumDynamicsList),
          leadingIcon: 'Pt',
          leadingIconBgColor: CustomColors.lightPurple,
          leadingIconColor: CustomColors.deepPurple,
          trailingValue: '${_metalsRatesState.getPlatinumData.Value}',
          trailingSubText: 'BYN / 1g',
          symbolsInsteadOfIcon: true,
          currencyGraph: _silverDynamicsState.isRequestIsUnsuccessful
              ? const Text('Graph of dynamics is unavailable',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: CustomColors.primaryGray,
                  ))
              : CustomGraph(
                  graphData: _platinumDynamicsState.getPlatinumDynamicsList
                      as List<Dynamics>,
                  graphWidth: 95,
                  titleText: '',
                  graphName: 'Platinum dynamics',
                  lineColor: CustomColors.deepPurple,
                  primaryXAxisIsVisible: false,
                  primaryYAxisIsVisible: false,
                ),
        ),
        GeneralListTile(
          titleText: 'Palladium',
          subtitleText: calcPercentageGrowth(
              dynamicsList: _palladiumDynamicsState.getPalladiumDynamicsList),
          leadingIcon: 'Pd',
          leadingIconBgColor: CustomColors.lightBlue,
          leadingIconColor: CustomColors.deepBlue,
          trailingValue: '${_metalsRatesState.getPalladiumData.Value}',
          trailingSubText: 'BYN / 1g',
          symbolsInsteadOfIcon: true,
          currencyGraph: _palladiumDynamicsState.isRequestIsUnsuccessful
              ? const Text('Graph of dynamics is unavailable',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: CustomColors.primaryGray,
                  ))
              : CustomGraph(
                  graphData: _palladiumDynamicsState.getPalladiumDynamicsList
                      as List<Dynamics>,
                  graphWidth: 95,
                  titleText: '',
                  graphName: 'Palladium dynamics',
                  lineColor: CustomColors.deepBlue,
                  primaryXAxisIsVisible: false,
                  primaryYAxisIsVisible: false,
                ),
        ),
      ]),
      Positioned.fill(
          child: _metalsRatesState.isRequestIsUnsuccessful
              ? Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            _metalsRatesState.errorDescrForCustomer,
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
                )
              : const SizedBox.shrink()),
    ]);
  }
}
