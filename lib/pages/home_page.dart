import 'package:currency_rates/colors.dart' as custom_colors;
import 'package:currency_rates/pages/all_currencies_page.dart';
import 'package:currency_rates/components/main_currency_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
            child: MainCurrenciesList(),
          ),
        ],
      ),
    );
  }
}
