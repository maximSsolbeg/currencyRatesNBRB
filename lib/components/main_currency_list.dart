import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:currency_rates/providers/rub_dynamics_provider.dart';
import 'package:currency_rates/providers/usd_dynamics_provider.dart';
import 'package:currency_rates/providers/eur_dynamics_provider.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/providers/cur_rates_provider.dart';
import 'package:currency_rates/pages/usd_page.dart';
import 'package:currency_rates/colors.dart';
import 'package:provider/provider.dart';
import 'custom_graph.dart';
import 'general_list_tile.dart';

class MainCurrenciesList extends StatefulWidget {
  @override
  State<MainCurrenciesList> createState() => _MainCurrenciesListState();
}

class _MainCurrenciesListState extends State<MainCurrenciesList> {
  void goToUsdPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UsdPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CurRatesProvider _currenciesRatesState =
        Provider.of<CurRatesProvider>(context);
    UsdDynamicsProvider _usdDynamicsState =
        Provider.of<UsdDynamicsProvider>(context);
    EurDynamicsProvider _eurDynamicsState =
        Provider.of<EurDynamicsProvider>(context);
    RubDynamicsProvider _rubDynamicsState =
        Provider.of<RubDynamicsProvider>(context);
    return Container(
      child: Stack(
          children: _currenciesRatesState.isRequestIsUnsuccessful
              ? [
                  ListView(
                    children: const [
                      DummyCurrency(),
                      DummyCurrency(),
                      DummyCurrency(),
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
                              _currenciesRatesState.errorDescrForCustomer,
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
                        titleText: 'US Dollar',
                        subtitleText: '+0.05%**',
                        leadingIcon: 'assets/dollar-currency-sign.svg',
                        leadingIconBgColor: CustomColors.lightPink,
                        leadingIconColor: CustomColors.deepOrange,
                        trailingValue:
                            '${_currenciesRatesState.getUsdData.Cur_OfficialRate}',
                        trailingSubText:
                            'BYN / 1 ${_currenciesRatesState.getUsdData.Cur_Abbreviation}',
                        onTapFunction: goToUsdPage,
                        currancyGraph: _usdDynamicsState.isRequestIsUnsuccessful
                            ? const Text('Graph of dynamics is unavailable',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: CustomColors.primaryGray,
                                ))
                            : CustomGraph(
                                graphData: _usdDynamicsState.getUsdDynamicsList
                                    as List<Dynamics>,
                                graphWidth: 95,
                                titleText: '',
                                graphName: 'USD dynamics',
                                lineColor: CustomColors.deepOrange,
                                primaryXAxisIsVisible: false,
                                primaryYAxisIsVisible: false,
                              ),
                      ),
                      GeneralListTile(
                        titleText: 'EURO',
                        subtitleText: '+0.02%**',
                        leadingIcon: 'assets/euro-currency-symbol.svg',
                        leadingIconBgColor: CustomColors.lightBlue,
                        leadingIconColor: CustomColors.deepBlue,
                        trailingValue:
                            '${_currenciesRatesState.getEurData.Cur_OfficialRate}',
                        trailingSubText:
                            'BYN / 1 ${_currenciesRatesState.getEurData.Cur_Abbreviation}',
                        currancyGraph: _eurDynamicsState.isRequestIsUnsuccessful
                            ? const Text('Graph of dynamics is unavailable',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: CustomColors.primaryGray,
                                ))
                            : CustomGraph(
                                graphData: _eurDynamicsState.getEurDynamicsList
                                    as List<Dynamics>,
                                graphWidth: 95,
                                titleText: '',
                                graphName: 'EUR dynamics',
                                lineColor: CustomColors.deepBlue,
                                primaryXAxisIsVisible: false,
                                primaryYAxisIsVisible: false,
                              ),
                      ),
                      GeneralListTile(
                        titleText: 'Russian Ruble',
                        subtitleText: '+0.01%**',
                        leadingIcon: 'assets/ruble-currency-sign.svg',
                        leadingIconBgColor: CustomColors.lightGreen,
                        leadingIconColor: CustomColors.deepGreen,
                        trailingValue:
                            '${_currenciesRatesState.getRubData.Cur_OfficialRate}',
                        trailingSubText:
                            'BYN/100 ${_currenciesRatesState.getRubData.Cur_Abbreviation}',
                        currancyGraph: _rubDynamicsState.isRequestIsUnsuccessful
                            ? const Text('Graph of dynamics is unavailable',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: CustomColors.primaryGray,
                                ))
                            : CustomGraph(
                                graphData: _rubDynamicsState.getRubDynamicsList
                                    as List<Dynamics>,
                                graphWidth: 95,
                                titleText: '',
                                graphName: 'RUB dynamics',
                                lineColor: CustomColors.deepGreen,
                                primaryXAxisIsVisible: false,
                                primaryYAxisIsVisible: false,
                              ),
                      ),
                    ],
                  ),
                ]),
    );
  }
}

class DummyCurrency extends StatelessWidget {
  const DummyCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GeneralListTile(
      titleText: 'Currency',
      subtitleText: '0.00%',
      symbolsInsteadOfIcon: true,
      leadingIcon: '-',
      trailingValue: '0.0',
      trailingSubText: '-- / --',
    );
  }
}
