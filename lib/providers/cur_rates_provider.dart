import 'package:flutter/widgets.dart';
import 'package:currency_rates/models/currency_mdl.dart';
import 'package:currency_rates/networking/currency_rates_api.dart';

class CurRatesProvider with ChangeNotifier {
  late List<Currency> allCurRatesList;

  List get getAllCurRatesList => allCurRatesList;

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

  bool isLoadingCurRates = false;
  bool isRequestIsUnsuccessful = false;
  String errorDescrForCustomer = 'Error of loading data form the server';

  void getCurRates(context) async {
    isLoadingCurRates = true;
    allCurRatesList = await getAllCurrencyRatesData();
    isLoadingCurRates = false;

    notifyListeners();
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

