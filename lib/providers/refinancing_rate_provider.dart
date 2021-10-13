import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:flutter/widgets.dart';
import 'package:currency_rates/models/refinancing_rate_mdl.dart';
import 'package:currency_rates/networking/refinancing_rate_api.dart';

class RefinancingRateProvider with ChangeNotifier {
  late List<Dynamics> fullRefRateList;

  RefinancingRate get getCurrentRefRate => RefinancingRate(
      Date: fullRefRateList[fullRefRateList.length - 1].Date,
      Value: fullRefRateList[fullRefRateList.length - 1].Value);

  List get getFullRefRateList => fullRefRateList;

  bool isLoadingRefRate = false;
  bool isRequestIsUnsuccessful = false;
  String errorDescrForCustomer =
      'Error of loading refinancing rate form the server';

  void getRefRate(context) async {
    isLoadingRefRate = true;
    fullRefRateList = await getRefinancingRate();
    isLoadingRefRate = false;

    notifyListeners();
  }

  Future<List<Dynamics>> getRefinancingRate() async {
    late List<Dynamics> actualRefRateList;

    await getCurrentRefinancingRate().then((refRateList) {
      if (refRateList.isNotEmpty) {
        isRequestIsUnsuccessful = false;
      }
      actualRefRateList = refRateList;
    }, onError: (er) {
      isRequestIsUnsuccessful = true;
    }).catchError((error) {
      throw Exception('Error of loading refinancing rate form the server');
    });
    isLoadingRefRate = false;

    return actualRefRateList;
  }
}
