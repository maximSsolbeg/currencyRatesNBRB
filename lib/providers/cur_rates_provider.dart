import 'package:flutter/widgets.dart';
import 'package:currency_rates/models/currency_mdl.dart';
import 'package:currency_rates/networking/currency_rates_api.dart';

class CurRatesProvider with ChangeNotifier {
  late List<Currency> allCurRatesList;

  late List<Currency> fullSortedCurRatesList = sortCurRatesList();

  List get getFullSortedCurRatesList => fullSortedCurRatesList;

  late Currency usdData = allCurRatesList.singleWhere((item) {
    return item.Cur_Abbreviation == 'USD';
  });

  Currency get getUsdData => usdData;

  late Currency eurData = allCurRatesList.singleWhere((item) {
    return item.Cur_Abbreviation == 'EUR';
  });

  Currency get getEurData => eurData;

  late Currency rubData = allCurRatesList.singleWhere((item) {
    return item.Cur_Abbreviation == 'RUB';
  });

  Currency get getRubData => rubData;

  late Currency uahData = allCurRatesList.singleWhere((item) {
    return item.Cur_Abbreviation == 'UAH';
  });

  late Currency plnData = allCurRatesList.singleWhere((item) {
    return item.Cur_Abbreviation == 'PLN';
  });

  late Currency cnyData = allCurRatesList.singleWhere((item) {
    return item.Cur_Abbreviation == 'CNY';
  });

  List get getAllCurRatesList => allCurRatesList;

  bool isLoadingCurRates = false;
  bool isRequestIsUnsuccessful = false;
  String errorDescrForCustomer = 'Error of loading data form the server';

  void getCurRates(context) async {
    isLoadingCurRates = true;
    allCurRatesList = await getAllCurrencyRatesData();
    isLoadingCurRates = false;

    notifyListeners();
  }

  List<Currency> sortCurRatesList () {
    allCurRatesList.removeWhere((item) => item == usdData);
    allCurRatesList.removeWhere((item) => item == eurData);
    allCurRatesList.removeWhere((item) => item == rubData);
    allCurRatesList.removeWhere((item) => item == plnData);
    allCurRatesList.removeWhere((item) => item == uahData);
    allCurRatesList.removeWhere((item) => item == cnyData);

    allCurRatesList.insert(0, usdData);
    allCurRatesList.insert(1, eurData);
    allCurRatesList.insert(2, rubData);
    allCurRatesList.insert(3, plnData);
    allCurRatesList.insert(4, uahData);
    allCurRatesList.insert(5, cnyData);

    return allCurRatesList;
  }

  Future<List<Currency>> getAllCurrencyRatesData() async {
    late List<Currency> notEmptyCurrencyList;

    await getAllCurRatesData().then((currencyList) {
      if (currencyList.isEmpty) {
        errorDescrForCustomer =
        'The Bank doesn\'t provide currency rates for this date';

        isRequestIsUnsuccessful = true;
      } else {
        notEmptyCurrencyList = currencyList;
      }
    }, onError: (er) {
      isRequestIsUnsuccessful = true;
    }).catchError((error) {
      throw Exception('Error of loading data form the server');
    });
    isLoadingCurRates = false;

    return notEmptyCurrencyList;
  }
}

