import 'package:currency_rates/colors.dart' as custom_colors;
import 'package:currency_rates/components/settings_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:currency_rates/pages/usd_page.dart';
import 'package:currency_rates/pages/home_page.dart';

void main() {
  runApp(const CurrenciesApp());
}

class CurrenciesApp extends StatelessWidget {
  const CurrenciesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
