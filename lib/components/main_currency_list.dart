import 'package:flutter/material.dart';
import 'package:currency_rates/providers/cur_rates_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:currency_rates/pages/usd_page.dart';
import 'package:currency_rates/colors.dart' ;
import 'package:provider/provider.dart';

class MainCurrenciesList extends StatefulWidget{

  @override
  State<MainCurrenciesList> createState() => _MainCurrenciesListState();
}

class _MainCurrenciesListState extends State<MainCurrenciesList> {
  @override
  Widget build(BuildContext context){
    CurRatesProvider _currenciesRatesState = Provider.of<CurRatesProvider>(context);
    return ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          // USD rates
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(_currenciesRatesState.getUsdData.Cur_Name),
            subtitle: Text('0.99*'),
            leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CustomColors.lightPink,
                ),
                child: Center(
                  child: SvgPicture.asset(
                      'assets/dollar-currency-sign.svg',
                      height: 24,
                      color: CustomColors.deepOrange
                  ),
                )
            ),
            trailing: SizedBox(
              height: double.infinity,
              width: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/graph.png',
                  ),
                  const SizedBox(width: 10,),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${_currenciesRatesState.getUsdData.Cur_OfficialRate}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _currenciesRatesState.getUsdData.Cur_Abbreviation,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ]
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UsdPage(),
                ),
              );
            },
          ),
          const Divider(
            height: 10,
            color: CustomColors.primaryGray,
          ),
          // EUR rates
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(_currenciesRatesState.getEurData.Cur_Name),
            subtitle: Text('0.28*'),
            leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CustomColors.lightBlue,
                ),
                child: Center(
                  child: SvgPicture.asset(
                      'assets/euro-currency-symbol.svg',
                      height: 24,
                      color: CustomColors.deepBlue
                  ),
                )
            ),
            trailing: SizedBox(
              height: double.infinity,
              width: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/graph.png',
                  ),
                  const SizedBox(width: 10,),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${_currenciesRatesState.getEurData.Cur_OfficialRate}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _currenciesRatesState.getEurData.Cur_Abbreviation,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ]
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UsdPage(),
                ),
              );
            },
          ),
          const Divider(
            height: 10,
            color: CustomColors.primaryGray,
          ),
          // RUR rates
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('${_currenciesRatesState.getRubData.Cur_Scale} ${_currenciesRatesState.getRubData.Cur_Name}'),
            subtitle: Text('0.28*'),
            leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CustomColors.lightGreen,
                ),
                child: Center(
                  child: SvgPicture.asset(
                      'assets/ruble-currency-sign.svg',
                      height: 24,
                      color: CustomColors.deepGreen
                  ),
                )
            ),
            trailing: SizedBox(
              height: double.infinity,
              width: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/graph.png',
                  ),
                  const SizedBox(width: 10,),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${_currenciesRatesState.getRubData.Cur_OfficialRate}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _currenciesRatesState.getRubData.Cur_Abbreviation,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ]
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UsdPage(),
                ),
              );
            },
          )
        ],
      );
  }
}
