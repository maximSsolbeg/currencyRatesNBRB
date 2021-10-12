import 'package:currency_rates/components/calculate_currency.dart';
import 'package:currency_rates/components/general_list_tile.dart';
import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:currency_rates/providers/cur_rates_provider.dart';
import 'package:currency_rates/providers/usd_dynamics_provider.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/components/settings_drawer.dart';
import 'package:currency_rates/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:currency_rates/components/custom_graph.dart';

class UsdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('USD details',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
  String reformatDate(date) {
    DateTime parseDt = DateTime.parse(date);
    var newFormat = DateFormat('dd.MM.yy');
    String updatedDt = newFormat.format(parseDt);

    return updatedDt;
  }

  @override
  Widget build(BuildContext context) {
    CurRatesProvider _currenciesRatesState =
        Provider.of<CurRatesProvider>(context);
    UsdDynamicsProvider _usdDynamicsState =
        Provider.of<UsdDynamicsProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
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
              onTapFunction: () {},
              currancyGraph: const SizedBox.shrink(),

            ),
            Stack(
              children: [
                CustomGraph(
                  graphData: _usdDynamicsState.getUsdDynamicsList
                      as List<Dynamics>,
                  titleText: 'Dynamics of BYN against USD',
                  graphName: 'USD dynamics',
                  lineColor: CustomColors.deepOrange,
                  primaryXAxisIsVisible: true,
                  primaryYAxisIsVisible: true,
                ),
                Positioned.fill(
                    child: _usdDynamicsState.isRequestIsUnsuccessful
                        ? Container(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      _usdDynamicsState.errorDescrForCustomer,
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
                          )
                        : const SizedBox.shrink())
              ],
            ),
            const CalculateCurrency(firstCurrency: 'USD', secondCurrency: 'BYN'),
          ],
        ),
      ),
    );
  }
}
