import 'package:currency_rates/models/currency_dynamics_mdl.dart';
import 'package:currency_rates/providers/usd_dynamics_provider.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/providers/cur_rates_provider.dart';
import 'package:currency_rates/pages/usd_page.dart';
import 'package:currency_rates/colors.dart' ;
import 'package:provider/provider.dart';
import 'custom_graph.dart';
import 'general_list_tile.dart';

class MainCurrenciesList extends StatefulWidget{

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
  Widget build(BuildContext context){
    CurRatesProvider _currenciesRatesState = Provider.of<CurRatesProvider>(context);
    UsdDynamicsProvider _usdDynamicsState = Provider.of<UsdDynamicsProvider>(context);
    return ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          GeneralListTile(
            titleText: 'US Dollar',
            subtitleText: '+0.05%**',
            leadingIcon: 'assets/dollar-currency-sign.svg',
            leadingIconBgColor: CustomColors.lightPink,
            leadingIconColor: CustomColors.deepOrange,
            trailingValue: '${_currenciesRatesState.getUsdData.Cur_OfficialRate}',
            trailingSubText: 'BYN / 1 ${_currenciesRatesState.getUsdData.Cur_Abbreviation}',
            onTapFunction: goToUsdPage,
            currancyGraph: CustomGraph(
              graphData: _usdDynamicsState.getUsdDynamicsList as List<CurrencyDynamics>,
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
            trailingValue: '${_currenciesRatesState.getEurData.Cur_OfficialRate}',
            trailingSubText: 'BYN / 1 ${_currenciesRatesState.getEurData.Cur_Abbreviation}',
            currancyGraph: CustomGraph(
              //TODO: implement eurGraphData
              // graphData: _usdDynamicsState,
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
            trailingValue: '${_currenciesRatesState.getRubData.Cur_OfficialRate}',
            trailingSubText: 'BYN/100 ${_currenciesRatesState.getRubData.Cur_Abbreviation}',
            currancyGraph: CustomGraph(
              //TODO: implement rubGraphData
              // graphData: _usdDynamicsState,
              graphWidth: 95,
              titleText: '',
              graphName: 'RUB dynamics',
              lineColor: CustomColors.deepGreen,
              primaryXAxisIsVisible: false,
              primaryYAxisIsVisible: false,
            ),
          ),
        ],
      );
  }
}
