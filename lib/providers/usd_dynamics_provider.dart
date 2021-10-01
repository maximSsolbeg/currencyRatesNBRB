import 'package:currency_rates/models/currency_dynamics_mdl.dart';
import 'package:currency_rates/networking/usd_dynamics_api.dart';
import 'package:flutter/widgets.dart';

class UsdDynamicsProvider with ChangeNotifier {
  late List<CurrencyDynamics> dynamicsList;
  List get getUsdDynamicsList => dynamicsList;

  bool isLoadingRefRate = false;

  void getUsdDynamics(context) async {
    isLoadingRefRate = true;
    dynamicsList = await getUsdDynamicsForAYear();
    isLoadingRefRate = false;

    notifyListeners();
  }
}
