import 'package:currency_rates/components/title_section.dart';
import 'package:currency_rates/pages/all_currencies_page.dart';
import 'package:currency_rates/components/main_currency_list.dart';
import 'package:currency_rates/providers/cur_rates_provider.dart';
import 'package:currency_rates/providers/eur_dynamics_provider.dart';
import 'package:currency_rates/providers/gold_dynamics_provider.dart';
import 'package:currency_rates/providers/metals_rates_provider.dart';
import 'package:currency_rates/providers/platinum_dynamics_provider.dart';
import 'package:currency_rates/providers/refinancing_rate_provider.dart';
import 'package:currency_rates/providers/rub_dynamics_provider.dart';
import 'package:currency_rates/providers/silver_dynamics_provider.dart';
import 'package:currency_rates/providers/palladium_dynamics_provider.dart';
import 'package:currency_rates/providers/usd_dynamics_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/components/refinancing_rate_list.dart';
import 'package:currency_rates/components/metals_rates_list.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurRatesProvider _allCurrencyRatesState =
        Provider.of<CurRatesProvider>(context);
    RefinancingRateProvider _refinansingRateState =
        Provider.of<RefinancingRateProvider>(context);
    MetalsRatesProvider _metalsRatesState =
        Provider.of<MetalsRatesProvider>(context);
    GoldDynamicsProvider _goldDynamicsState =
        Provider.of<GoldDynamicsProvider>(context);
    SilverDynamicsProvider _silverDynamicsState =
        Provider.of<SilverDynamicsProvider>(context);
    PlatinumDynamicsProvider _platinumDynamicsState =
        Provider.of<PlatinumDynamicsProvider>(context);
    PalladiumDynamicsProvider _palladiumDynamicsState =
        Provider.of<PalladiumDynamicsProvider>(context);
    UsdDynamicsProvider _usdDynamicsState =
        Provider.of<UsdDynamicsProvider>(context);
    EurDynamicsProvider _eurDynamicsState =
        Provider.of<EurDynamicsProvider>(context);
    RubDynamicsProvider _rubDynamicsState =
        Provider.of<RubDynamicsProvider>(context);

    bool isSomeCurrencyDataIsLoading =
        _allCurrencyRatesState.isLoadingCurRates ||
            _usdDynamicsState.isLoadingUsdDynamics ||
            _eurDynamicsState.isLoadingEurDynamics ||
            _rubDynamicsState.isLoadingRubDynamics;

    bool isSomeMetalDataIsLoading = _metalsRatesState.isLoadingMetalsRates ||
        _goldDynamicsState.isLoadingGoldDynamics ||
        _silverDynamicsState.isLoadingSilverDynamics ||
        _platinumDynamicsState.isLoadingPlatinumDynamics ||
        _palladiumDynamicsState.isLoadingPalladiumDynamics;

    void goToSeeAllPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AllCurrenciesPage(),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
        child: Column(
          //Currency Rates
          children: <Widget>[
            TitleSection(
                title: 'Currencies',
                withButton: true,
                buttonText: 'See All',
                goToPageCallback: goToSeeAllPage,
            ),
            Container(
              height: 280,
              child: isSomeCurrencyDataIsLoading
                  ? const Center(child: CircularProgressIndicator())
                  : MainCurrenciesList(),
            ),

            //Refinancing Rate
            const TitleSection(
              title: 'Refinancing Rate',
            ),
            SizedBox(
              height: 80,
              child: _refinansingRateState.isLoadingRefRate
                  ? const Center(child: CircularProgressIndicator())
                  : RefinancingRateList(),
            ),

            //Precious Metals Prices
            const TitleSection(
              title: 'Precious Metals Prices',
            ),
            SizedBox(
              height: 370,
              child: isSomeMetalDataIsLoading
                  ? const Center(child: CircularProgressIndicator())
                  : MetalsRatesList(),
            ),
          ],
        ),
      ),
    );
  }
}
