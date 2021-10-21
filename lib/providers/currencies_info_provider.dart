import 'package:currency_rates/models/currency_info_mdl.dart';
import 'package:currency_rates/networking/currencies_info_api.dart';
import 'package:flutter/widgets.dart';

//contains currency info without rates
class CurrenciesInfoProvider with ChangeNotifier {
  late List<CurrencyInfo> allCurInfoList;

  List<CurrencyInfo> get getCurrenciesInfoList => allCurInfoList;

  bool isLoadingCurInfo = false;
  bool isRequestIsUnsuccessful = false;
  String errorDescrForCustomer = 'Error of loading currencies info without rates form the server';

  void getCurrenciesInfoData(context) async {
    isLoadingCurInfo = true;
    allCurInfoList = await getAllCurInfoData();
    isLoadingCurInfo = false;

    notifyListeners();
  }

  Future<List<CurrencyInfo>> getAllCurInfoData() async {
    late List<CurrencyInfo> notEmptyCurInfoList;

    await getCurrenciesInfo().then((currenciesInfoList) {
      if (currenciesInfoList.isEmpty) {
        isRequestIsUnsuccessful = true;
      } else {
        notEmptyCurInfoList = currenciesInfoList;
      }
    }, onError: (er) {
      isRequestIsUnsuccessful = true;
    }).catchError((error) {
      throw Exception('Error of loading currencies info without rates form the server');
    });
    isLoadingCurInfo = false;
    return notEmptyCurInfoList;
  }
}
