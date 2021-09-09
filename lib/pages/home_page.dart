import 'package:currency_rates/colors.dart' as custom_colors;
import 'package:currency_rates/pages/all_currencies_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:currency_rates/pages/usd_page.dart';
import 'package:currency_rates/temporary_data.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadExRatesData();
  }

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
            height: 245,
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
