import 'package:currency_rates/colors.dart' as custom_colors;
import 'package:currency_rates/components/main_currency_list.dart';
import 'package:currency_rates/components/settings_drawer.dart';
import 'package:currency_rates/pages/all_currencies_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/pages/usd_page.dart';
import 'package:currency_rates/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:currency_rates/data.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CurRatesProvider()),
      Provider(create: (context) => HomePage()),
      Provider(create: (context) => AllCurrenciesPage()),
      Provider(create: (context) => MainCurrenciesList()),
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
  }

  @override
  Widget build(BuildContext context) {
    final allCurMdl = Provider.of<CurRatesProvider>(context);
    return Consumer<CurRatesProvider>(
      builder: (context, cart, child) {
        return MaterialApp(
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
                iconTheme: const IconThemeData(color: custom_colors.secondaryGray),
              ),
              body: allCurMdl.isLoadingCurRates
                ? Center(child: CircularProgressIndicator())
                : HomePage(),
              endDrawer: const SettingsDrawer(),
            ),
            initialRoute: '/',
            routes: {
              '/usd_page': (context) => UsdPage()
            }
        );
      }
    );
  }
}
