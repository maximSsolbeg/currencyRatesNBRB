import 'package:currency_rates/common/growth.dart';
import 'package:currency_rates/components/calculate_currency.dart';
import 'package:currency_rates/components/general_list_tile.dart';
import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:currency_rates/providers/cur_rates_provider.dart';
import 'package:currency_rates/providers/rub_dynamics_provider.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/components/settings_drawer.dart';
import 'package:currency_rates/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:currency_rates/components/custom_graph.dart';

class RubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RUB details',
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
      body: RubPageBody(),
      endDrawer: const SettingsDrawer(),
    );
  }
}

class RubPageBody extends StatefulWidget {
  @override
  State<RubPageBody> createState() => _RubPageBodyState();
}

class _RubPageBodyState extends State<RubPageBody> {
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
    RubDynamicsProvider _rubDynamicsState =
        Provider.of<RubDynamicsProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            GeneralListTile(
              titleText: 'RUB',
              subtitleText: calcPercentageGrowth(
                  dynamicsList: _rubDynamicsState.getRubDynamicsList),
              leadingIcon: 'assets/ruble-currency-sign.svg',
              leadingIconBgColor: CustomColors.lightGreen,
              leadingIconColor: CustomColors.deepGreen,
              trailingValue:
                  '${_currenciesRatesState.getRubData.Cur_OfficialRate}',
              trailingSubText:
                  'BYN / 1 ${_currenciesRatesState.getRubData.Cur_Abbreviation}',
              onTapFunction: () {},
              currancyGraph: const SizedBox.shrink(),
            ),
            Stack(
              children: [
                CustomGraph(
                  graphData:
                      _rubDynamicsState.getRubDynamicsList as List<Dynamics>,
                  titleText: 'Dynamics of BYN against RUB',
                  graphName: 'RUB dynamics',
                  lineColor: CustomColors.deepGreen,
                  primaryXAxisIsVisible: true,
                  primaryYAxisIsVisible: true,
                ),
                Positioned.fill(
                    child: _rubDynamicsState.isRequestIsUnsuccessful
                        ? Container(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      _rubDynamicsState.errorDescrForCustomer,
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
              firstCurrency: 'RUB',
              secondCurrency: 'BYN',
              bgrColor: CustomColors.lightGreen,
              textColor: CustomColors.deepGreen,
            ),
          ],
        ),
      ),
    );
  }
}
