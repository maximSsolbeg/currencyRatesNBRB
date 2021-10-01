import 'package:currency_rates/models/metal_mdl.dart';
import 'package:flutter/widgets.dart';
import 'package:currency_rates/networking/metals_rates_api.dart';

class MetalsRatesProvider with ChangeNotifier{

  late List<Metal> allMetalsRatesList;
  List get getAllMetalsRatesList => allMetalsRatesList;

  //gold
  late Metal goldData = allMetalsRatesList.singleWhere((item) {
    return item.MetalId == 0;
  });
  Metal get getGoldData => goldData;

  //silver
  late Metal silverData = allMetalsRatesList.singleWhere((item) {
    return item.MetalId == 1;
  });
  Metal get getSilverData => silverData;

  //platinum
  late Metal platinumData = allMetalsRatesList.singleWhere((item) {
    return item.MetalId == 2;
  });
  Metal get getPlatinumData => platinumData;

  //palladium
  late Metal palladiumData = allMetalsRatesList.singleWhere((item) {
    return item.MetalId == 3;
  });
  Metal get getPalladiumData => palladiumData;

  bool isLoadingMetalsRates = false;

  void getCurMetalsRates(context) async {
    isLoadingMetalsRates = true;
    allMetalsRatesList = await getMetalsRates();
    isLoadingMetalsRates = false;

    notifyListeners();
  }
}
