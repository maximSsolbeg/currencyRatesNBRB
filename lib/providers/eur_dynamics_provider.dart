import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:currency_rates/networking/currency_dynamics_api.dart';
import 'package:flutter/widgets.dart';

class EurDynamicsProvider with ChangeNotifier {
  late List<Dynamics> dynamicsList;
  List get getEurDynamicsList => dynamicsList;

  bool isLoadingEurDynamics = false;
  bool isRequestIsUnsuccessful = false;
  String errorDescrForCustomer = 'Error of loading dynamics of EUR data form the server';

  void getEurDynamics(context) async {
    isLoadingEurDynamics = true;
    dynamicsList = await getEurDynamicsData();
    isLoadingEurDynamics = false;

    notifyListeners();
  }

  Future<List<Dynamics>> getEurDynamicsData() async {
    late List<Dynamics> eurDynamicsData;

    await getCurDynamicsForAYear(curId: 292).then((dynamicsData) {
      if (dynamicsData.isNotEmpty) {
        eurDynamicsData = dynamicsData;
      } else {
        errorDescrForCustomer =
        'The Bank doesn\'t provide dynamics of EUR for this date';
        isRequestIsUnsuccessful = true;
      }
    }, onError: (er) {
      isRequestIsUnsuccessful = true;
    }).catchError((error) {
      throw Exception('Error of loading dynamics of EUR form the server');
    });
    isLoadingEurDynamics = false;

    return eurDynamicsData;
  }
}
