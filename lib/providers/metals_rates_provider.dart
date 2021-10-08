import 'package:currency_rates/models/metal_mdl.dart';
import 'package:flutter/widgets.dart';
import 'package:currency_rates/networking/metals_rates_api.dart';

class MetalsRatesProvider with ChangeNotifier {
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
  bool isRequestIsUnsuccessful = false;
  String errorDescrForCustomer = 'Error of loading data form the server';

  void getCurMetalsRates(context) async {
    isLoadingMetalsRates = true;
    allMetalsRatesList = await getMetalsRates();
    isLoadingMetalsRates = false;

    notifyListeners();
  }

  Future<List<Metal>> getMetalsRates() async {
    late List<Metal> notEmptyMetalsList;

    await getCurrentMetalsRates().then((metalsList) {
      if (metalsList.length != 4) {
        errorDescrForCustomer =
            'The Bank doesn\'t provide rate of metals for this date';

        final _dummyList = List<Metal>.generate(
            4, (index) => Metal(Date: '-', Value: 0.0, MetalId: index));
        notEmptyMetalsList = _dummyList;

        isRequestIsUnsuccessful = true;
      } else {
        notEmptyMetalsList = metalsList;
      }
    }, onError: (er) {
      isRequestIsUnsuccessful = true;
    }).catchError((error) {
      throw Exception('Error of loading data form the server');
    });
    isLoadingMetalsRates = false;

    return notEmptyMetalsList;
  }
}
