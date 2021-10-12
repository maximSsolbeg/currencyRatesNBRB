import 'package:currency_rates/colors.dart';
import 'package:currency_rates/pages/all_currencies_page.dart';
import 'package:currency_rates/components/main_currency_list.dart';
import 'package:currency_rates/providers/cur_rates_provider.dart';
import 'package:currency_rates/providers/metals_rates_provider.dart';
import 'package:currency_rates/providers/refinancing_rate_provider.dart';
import 'package:currency_rates/providers/usd_dynamics_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/components/refinancing_rate_list.dart';
import 'package:currency_rates/components/metals_rates_list.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CurRatesProvider _allCurrencyRatesState = Provider.of<CurRatesProvider>(context);
    RefinancingRateProvider _refinancialRateState = Provider.of<RefinancingRateProvider>(context);
    MetalsRatesProvider _metalsRatesState = Provider.of<MetalsRatesProvider>(context);
    UsdDynamicsProvider _usdDynamicsState = Provider.of<UsdDynamicsProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //Currency Rates
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                    'Currencies',
                    style: TextStyle(
                      color: CustomColors.primaryGray,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(
                  height: 20,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: const Size.fromHeight(15.0),
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(60, 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllCurrenciesPage(),
                        ),
                      );
                    },
                    child: const Text(
                        'See All',
                        style: TextStyle(
                          color: CustomColors.deepOrange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 245,
              margin: const EdgeInsets.only(top: 14.0),
              child: _allCurrencyRatesState.isLoadingCurRates || _usdDynamicsState.isLoadingUsdDynamics
                  ? const Center(child: CircularProgressIndicator())
                  : MainCurrenciesList(),
            ),

            //Refinancing Rate
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                  child: const Text(
                      'Refinancing Rate',
                      style: TextStyle(
                        color: CustomColors.primaryGray,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
              ],
            ),
            Container(
              height: 85,
              child: _refinancialRateState.isLoadingRefRate
                  ? const Center(child: CircularProgressIndicator())
                  : RefinancingRateList(),
            ),

            //Precious Metals Prices
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                  child: const Text(
                      'Precious Metals Prices',
                      style: TextStyle(
                        color: CustomColors.primaryGray,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
              ],
            ),
            Container(
              height: 330,
              child: _metalsRatesState.isLoadingMetalsRates
                  ? const Center(child: CircularProgressIndicator())
                  : MetalsRatesList(),
            ),
          ],
        ),
      ),
    );
  }
}
