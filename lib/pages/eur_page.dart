import 'package:currency_rates/common/growth.dart';
import 'package:currency_rates/components/calculate_currency.dart';
import 'package:currency_rates/components/general_list_tile.dart';
import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:currency_rates/providers/cur_rates_provider.dart';
import 'package:currency_rates/providers/eur_dynamics_provider.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/components/settings_drawer.dart';
import 'package:currency_rates/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:currency_rates/components/custom_graph.dart';

class EurPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EUR details',
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
      body: EurPageBody(),
      endDrawer: const SettingsDrawer(),
    );
  }
}

class EurPageBody extends StatefulWidget {
  @override
  State<EurPageBody> createState() => _EurPageBodyState();
}

class _EurPageBodyState extends State<EurPageBody> {
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
    EurDynamicsProvider _eurDynamicsState =
        Provider.of<EurDynamicsProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            GeneralListTile(
              titleText: 'EURO',
              subtitleText: calcPercentageGrowth(
                  dynamicsList: _eurDynamicsState.getEurDynamicsList),
              leadingIcon: 'assets/euro-currency-symbol.svg',
              leadingIconBgColor: CustomColors.lightBlue,
              leadingIconColor: CustomColors.deepBlue,
              trailingValue:
                  '${_currenciesRatesState.getEurData.Cur_OfficialRate}',
              trailingSubText:
                  'BYN / 1 ${_currenciesRatesState.getEurData.Cur_Abbreviation}',
              onTapFunction: () {},
              currencyGraph: const SizedBox.shrink(),
            ),
            Stack(
              children: [
                CustomGraph(
                  graphData:
                      _eurDynamicsState.getEurDynamicsList as List<Dynamics>,
                  titleText: 'Dynamics of BYN against EUR',
                  graphName: 'EUR dynamics',
                  lineColor: CustomColors.deepBlue,
                  primaryXAxisIsVisible: true,
                  primaryYAxisIsVisible: true,
                ),
                Positioned.fill(
                    child: _eurDynamicsState.isRequestIsUnsuccessful
                        ? Container(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      _eurDynamicsState.errorDescrForCustomer,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
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
            const CalculateCurrency(
              firstCurrency: 'eur',
              secondCurrency: 'byn',
              bgrColor: CustomColors.lightBlue,
              textColor: CustomColors.deepBlue,
            ),
          ],
        ),
      ),
    );
  }
}
