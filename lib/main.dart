import 'package:currency_rates/colors.dart' ;
import 'package:currency_rates/components/settings_drawer.dart';
import 'package:currency_rates/providers/eur_dynamics_provider.dart';
import 'package:currency_rates/providers/metals_rates_provider.dart';
import 'package:currency_rates/providers/rub_dynamics_provider.dart';
import 'package:currency_rates/providers/usd_dynamics_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/pages/usd_page.dart';
import 'package:currency_rates/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:currency_rates/providers/cur_rates_provider.dart';
import 'package:currency_rates/providers/refinancing_rate_provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<CurRatesProvider>(create: (context) => CurRatesProvider()),
      ChangeNotifierProvider<RefinancingRateProvider>(create: (context) => RefinancingRateProvider()),
      ChangeNotifierProvider<MetalsRatesProvider>(create: (context) => MetalsRatesProvider()),
      ChangeNotifierProvider<UsdDynamicsProvider>(create: (context) => UsdDynamicsProvider()),
      ChangeNotifierProvider<EurDynamicsProvider>(create: (context) => EurDynamicsProvider()),
      ChangeNotifierProvider<RubDynamicsProvider>(create: (context) => RubDynamicsProvider()),
    ],
    child: CurrenciesApp(),
  )
);

class CurrenciesApp extends StatefulWidget {
  const CurrenciesApp({Key? key}) : super(key: key);

  @override
  State<CurrenciesApp> createState() => _CurrenciesAppState();
}

class _CurrenciesAppState extends State<CurrenciesApp> {
  @override
  void initState() {
    super.initState();
    final allCurMdl = Provider.of<CurRatesProvider>(context, listen: false);
    allCurMdl.getCurRates(context);

    final refinanceRateMdl = Provider.of<RefinancingRateProvider>(context, listen: false);
    refinanceRateMdl.getRefRate(context);

    final allMetalsRatesMdl = Provider.of<MetalsRatesProvider>(context, listen: false);
    allMetalsRatesMdl.getCurMetalsRates(context);

    final usdDynamicsMdl = Provider.of<UsdDynamicsProvider>(context, listen: false);
    usdDynamicsMdl.getUsdDynamics(context);

    final eurDynamicsMdl = Provider.of<EurDynamicsProvider>(context, listen: false);
    eurDynamicsMdl.getEurDynamics(context);

    final rubDynamicsMdl = Provider.of<RubDynamicsProvider>(context, listen: false);
    rubDynamicsMdl.getRubDynamics(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text(
            'Rates',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            )
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: CustomColors.secondaryGray),
        ),
        body: HomePage(),
        endDrawer: const SettingsDrawer(),
      ),
      initialRoute: '/',
      routes: {
        '/usd_page': (context) => UsdPage()
      }
    );
  }
}
