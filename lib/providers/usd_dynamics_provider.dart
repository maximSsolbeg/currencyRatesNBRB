import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:currency_rates/networking/currency_dynamics_api.dart';
import 'package:flutter/widgets.dart';

class UsdDynamicsProvider with ChangeNotifier {
  late List<Dynamics> dynamicsList;
  List get getUsdDynamicsList => dynamicsList;

  bool isLoadingUsdDynamics = false;
  bool isRequestIsUnsuccessful = false;
  String errorDescrForCustomer = 'Error of loading USD dynamics data form the server';

  void getUsdDynamics(context) async {
    isLoadingUsdDynamics = true;
    dynamicsList = await getUsdDynamicsData();
    isLoadingUsdDynamics = false;

    notifyListeners();
  }

  Future<List<Dynamics>> getUsdDynamicsData() async {
    late List<Dynamics> usdDynamicsData;

    // Cur_Id of USD is 431 (do not confuse with old 145 which works for dynamics before 2021-07-08)
    await getCurDynamicsForAYear(curId: 431).then((dynamicsData) {
      if (dynamicsData.isNotEmpty) {
        usdDynamicsData = dynamicsData;
      } else {
        errorDescrForCustomer =
        'The Bank doesn\'t provide refinancing rate for this date';
        isRequestIsUnsuccessful = true;
      }
    }, onError: (er) {
      isRequestIsUnsuccessful = true;
    }).catchError((error) {
      throw Exception('Error of loading refinancing rate form the server');
    });
    isLoadingUsdDynamics = false;

    return usdDynamicsData;
  }
}
