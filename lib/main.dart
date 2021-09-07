import 'package:currency_rates/colors.dart';
import 'package:currency_rates/components/currency_tile.dart';
import 'package:currency_rates/settings_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const CurrenciesApp());
}

const List<Map<String, dynamic>> mockedData = [
  {
    "curID": 431,
    "currencyIcon": Icons.wb_sunny,
    "date": "2021-09-02T00:00:00",
    "curAbbreviation": "USD",
    "curScale": 1,
    "percentageGrowth": 0.28,
    "curName": "Доллар США",
    "curOfficialRate": 2.5104
  },
  {
    "curID": 122,
    "currencyIcon": Icons.wb_cloudy,
    "date": "2021-09-02T00:00:00",
    "curAbbreviation": "EUR",
    "curScale": 1,
    "percentageGrowth": 0.08,
    "curName": "Евро",
    "curOfficialRate": 3.2589
  },
  {
    "curID": 429,
    "currencyIcon": Icons.wb_cloudy_outlined,
    "date": "2021-09-02T00:00:00",
    "curAbbreviation": "GBP",
    "curScale": 100,
    "percentageGrowth": -0.84,
    "curName": "Фунт стерлингов",
    "curOfficialRate": 3.4533
  }
];

const List<Map<String, dynamic>> mainCurrencies = [
  {
    'currencyIcon': 'dollar-currency-sign',
    'curAbbreviation': "USD",
    'curScale': 1,
    'percentageGrowth': 0.28,
    'curNameEng': 'US Dollar',
    'curOfficialRate': 2.5104,
    'iconBgrColor': Color(0XFFFEF1EE),
    'iconColor': Color(0XFFEE6856),
  },
  {
    'currencyIcon': 'euro-currency-symbol',
    'curAbbreviation': "EUR",
    'curScale': 1,
    'percentageGrowth': 0.15,
    'curNameEng': 'Euro',
    'curOfficialRate': 2.9823,
    'iconBgrColor': Color(0XFFF1F2F8),
    'iconColor': Color(0XFF6F7CB9),
  },
  {
    'currencyIcon': 'ruble-currency-sign',
    'curAbbreviation': "RUB",
    'curScale': 1,
    'percentageGrowth': -0.15,
    'curNameEng': '100 Russian Rubles',
    'curOfficialRate': 3.4515,
    'iconBgrColor': Color(0XFFECFBF6),
    'iconColor': Color(0XFF3BD39D),
  },
];

final deepOrange = Color(0XFFEE6856);
final primaryGray = Color(0XFFCCD1E0);
final paleGray = Color(0XFFF4F6F7);
final secondaryGray = Color(0XFFBCC3D8);
final lightPink = Color(0XFFFEF1EE);
final lightBlue = Color(0XFFF1F2F8);
final deepBlue = Color(0XFF6F7CB9);
final lightGreen = Color(0XFFECFBF6);
final deepGreen = Color(0XFF3BD39D);
final lightPurple = Color(0XFFF1F1FE);
final deepPurple = Color(0XFF6372F8);

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
          iconTheme: IconThemeData(color: secondaryGray),
        ),
        body: HomePage(),
        endDrawer: SettingsDrawer(),
      )
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Currencies',
                style: TextStyle(
                  color: primaryGray,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: deepOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              ),
            ],
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.only(top: 14.0),
            decoration: const BoxDecoration(
              // color: Colors.grey,
              border: Border(bottom: BorderSide(width: 1, color: Color(0XFFBCC3D8))),
            ),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: mockedData.length,
              // itemExtent: 70,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 10,
                  color: paleGray,
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
                  trailing: Column(
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
                        style: TextStyle(
                          fontSize: 12,
                          color: secondaryGray,
                        ),
                      ),
                    ]
                  )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
