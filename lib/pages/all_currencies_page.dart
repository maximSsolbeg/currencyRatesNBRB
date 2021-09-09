import 'package:currency_rates/temporary_data.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/components/settings_drawer.dart';
import 'package:currency_rates/colors.dart' as custom_colors;
import 'package:currency_rates/pages/home_page.dart';
import 'package:intl/intl.dart';

var currentDate = DateTime.parse(allRates[0]["Date"]);
var formattedDate = DateFormat.yMMMd().format(currentDate);

class AllCurrenciesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
                'All currency rates for ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                )
            ),
            Text(
                formattedDate,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                )
            ),
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0XFFCCD1E0)),
          onPressed: () {
            Route route = MaterialPageRoute(builder: (context) => HomePage());
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: custom_colors.secondaryGray),
      ),
      body: AllCurrenciesPageBody(),
      endDrawer: const SettingsDrawer(),
    );
  }
}

class AllCurrenciesPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                height: 2,
                color: custom_colors.primaryGray,
              );
            },
            itemCount: allRates.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(allCurrencies[index]["Cur_Name_Eng"]),
                subtitle: Text(
                  'Currency Scale - 1:${allRates[index]["Cur_Scale"]}',
                  style: const TextStyle(
                    color: custom_colors.secondaryGray,
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${allRates[index]["Cur_OfficialRate"]}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      allRates[index]["Cur_Abbreviation"],
                      style: const TextStyle(
                        fontSize: 12,
                        color: custom_colors.secondaryGray,
                      ),
                    ),
                  ],
                )
              );
            },
          ),
    );
  }
}
