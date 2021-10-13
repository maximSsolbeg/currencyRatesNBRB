import 'package:currency_rates/models/currency_info_mdl.dart';
import 'package:currency_rates/temporary_data.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/components/settings_drawer.dart';
import 'package:currency_rates/colors.dart';
import 'package:provider/provider.dart';
import 'package:currency_rates/providers/cur_rates_provider.dart';
import 'package:currency_rates/providers/currencies_info_provider.dart';
import 'package:currency_rates/common/format_date.dart';

class AllCurrenciesPage extends StatefulWidget {
  @override
  State<AllCurrenciesPage> createState() => _AllCurrenciesPageState();
}

class _AllCurrenciesPageState extends State<AllCurrenciesPage> {
  @override
  void initState() {
    super.initState();
    final currenciesInfoMdl =
        Provider.of<CurrenciesInfoProvider>(context, listen: false);
    currenciesInfoMdl.getCurrenciesInfoData(context);
  }

  @override
  Widget build(BuildContext context) {
    CurRatesProvider _allCurrencyRatesState =
        Provider.of<CurRatesProvider>(context);
    CurrenciesInfoProvider _currenciesInfoState =
        Provider.of<CurrenciesInfoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('All currency rates for ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                )),
            Text(FormatDate(_allCurrencyRatesState.getAllCurRatesList[0].Date),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                )),
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0XFFCCD1E0)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: CustomColors.secondaryGray),
      ),
      body: _currenciesInfoState.isLoadingCurInfo
          ? const Center(child: CircularProgressIndicator())
          : AllCurrenciesPageBody(),
      endDrawer: const SettingsDrawer(),
    );
  }
}

class AllCurrenciesPageBody extends StatefulWidget {
  @override
  State<AllCurrenciesPageBody> createState() => _AllCurrenciesPageBodyState();
}

class _AllCurrenciesPageBodyState extends State<AllCurrenciesPageBody> {
  String getEngCurrencyName({
      required List<CurrencyInfo> fullCurInfoList,
      required List curRatesList,
      required int index}) {
    return fullCurInfoList.singleWhere((item) {
      return item.Cur_ID == curRatesList[index].Cur_ID;
    }).Cur_Name_Eng;
  }

  @override
  Widget build(BuildContext context) {
    CurRatesProvider _allCurRatesState = Provider.of<CurRatesProvider>(context);
    CurrenciesInfoProvider _currenciesInfoState =
        Provider.of<CurrenciesInfoProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            height: 2,
            color: CustomColors.primaryGray,
          );
        },
        itemCount: allRates.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(getEngCurrencyName(
                  fullCurInfoList: _currenciesInfoState.getCurrenciesInfoList,
                  curRatesList: _allCurRatesState.getFullSortedCurRatesList,
                  index: index)),
              subtitle: Text(
                'Currency Scale - 1:${_allCurRatesState.getFullSortedCurRatesList[index].Cur_Scale}',
                style: const TextStyle(
                  color: CustomColors.secondaryGray,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${_allCurRatesState.getFullSortedCurRatesList[index].Cur_OfficialRate}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _allCurRatesState
                        .getFullSortedCurRatesList[index].Cur_Abbreviation,
                    style: const TextStyle(
                      fontSize: 12,
                      color: CustomColors.secondaryGray,
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
