import 'package:flutter/widgets.dart';
import 'package:currency_rates/models/refinancing_rate_mdl.dart';
import 'package:currency_rates/networking/refinancing_rate_api.dart';

class RefinancingRateProvider with ChangeNotifier {
  late RefinancingRate refRate;
  RefinancingRate get getCurrentRefRate => refRate;

  bool isLoadingRefRate = false;

  void getRefRate(context) async {
    isLoadingRefRate = true;
    refRate = await getCurrentRefinancingRate();
    isLoadingRefRate = false;

    notifyListeners();
  }

}
