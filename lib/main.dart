import 'package:currency_rates/colors.dart' as custom_colors;
import 'package:currency_rates/settings_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:currency_rates/usd_page.dart';

void main() {
  runApp(const CurrenciesApp());
}

const List<Map<String, dynamic>> mainCurrencies = [
  {
    'currencyIcon': 'dollar-currency-sign',
    'curAbbreviation': "USD",
    'curScale': 1,
    'percentageGrowth': 0.28,
    'curNameEng': 'US Dollar',
    'curOfficialRate': 2.5104,
    'iconBgrColor': custom_colors.lightPink,
    'iconColor': custom_colors.deepOrange,
  },
  {
    'currencyIcon': 'euro-currency-symbol',
    'curAbbreviation': "EUR",
    'curScale': 1,
    'percentageGrowth': 0.15,
    'curNameEng': 'Euro',
    'curOfficialRate': 2.9823,
    'iconBgrColor': custom_colors.lightBlue,
    'iconColor': custom_colors.deepBlue,
  },
  {
    'currencyIcon': 'ruble-currency-sign',
    'curAbbreviation': "RUB",
    'curScale': 1,
    'percentageGrowth': -0.15,
    'curNameEng': '100 Russian Rubles',
    'curOfficialRate': 3.4515,
    'iconBgrColor': custom_colors.lightGreen,
    'iconColor': custom_colors.deepGreen,
  },
];



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

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Currencies',
                style: TextStyle(
                  color: custom_colors.primaryGray,
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
                  onPressed: () {},
                  child: const Text(
                      'See All',
                      style: TextStyle(
                        color: custom_colors.deepOrange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
              ),

            ],
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.only(top: 14.0),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: custom_colors.secondaryGray)),
            ),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: mainCurrencies.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 10,
                  color: custom_colors.primaryGray,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(mainCurrencies[index]['curNameEng']),
                  subtitle: Text('${mainCurrencies[index]["percentageGrowth"]}'),
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainCurrencies[index]['iconBgrColor'],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/${mainCurrencies[index]['currencyIcon']}.svg',
                        height: 24,
                        color: mainCurrencies[index]['iconColor']
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
                          // height: 20,
                          // width: 30,
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${mainCurrencies[index]['curOfficialRate']}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                // color: secondaryGray,
                              ),
                            ),
                            Text(
                              '${mainCurrencies[index]["curAbbreviation"]}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: custom_colors.secondaryGray,
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
