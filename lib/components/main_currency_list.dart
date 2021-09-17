import 'package:flutter/material.dart';
import 'package:currency_rates/data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:currency_rates/pages/usd_page.dart';
import 'package:currency_rates/colors.dart' as custom_colors;
import 'package:provider/provider.dart';

class MainCurrenciesList extends StatefulWidget{

  @override
  State<MainCurrenciesList> createState() => _MainCurrenciesListState();
}

class _MainCurrenciesListState extends State<MainCurrenciesList> {
  @override
  Widget build(BuildContext context){
    return Consumer<CurRatesProvider>(
      builder: (context, cart, child) => ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          // USD rates
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(cart.getUsdData.Cur_Name),
            subtitle: Text('0.99*'),
            leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: custom_colors.lightPink,
                ),
                child: Center(
                  child: SvgPicture.asset(
                      'assets/dollar-currency-sign.svg',
                      height: 24,
                      color: custom_colors.deepOrange
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
                          '${cart.getUsdData.Cur_OfficialRate}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          cart.getUsdData.Cur_Abbreviation,
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
            color: custom_colors.primaryGray,
          ),
          // EUR rates
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(cart.getEurData.Cur_Name),
            subtitle: Text('0.28*'),
            leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: custom_colors.lightBlue,
                ),
                child: Center(
                  child: SvgPicture.asset(
                      'assets/euro-currency-symbol.svg',
                      height: 24,
                      color: custom_colors.deepBlue
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
                          '${cart.getEurData.Cur_OfficialRate}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          cart.getEurData.Cur_Abbreviation,
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
            color: custom_colors.primaryGray,
          ),
          // RUR rates
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('${cart.getRubData.Cur_Scale} ${cart.getRubData.Cur_Name}'),
            subtitle: Text('0.28*'),
            leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: custom_colors.lightGreen,
                ),
                child: Center(
                  child: SvgPicture.asset(
                      'assets/ruble-currency-sign.svg',
                      height: 24,
                      color: custom_colors.deepGreen
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
                          '${cart.getRubData.Cur_OfficialRate}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          cart.getRubData.Cur_Abbreviation,
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
      ),
    );
  }
}
