import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:currency_rates/networking/currency_dynamics_api.dart';
import 'package:flutter/widgets.dart';

class RubDynamicsProvider with ChangeNotifier {
  late List<Dynamics> dynamicsList;
  List get getRubDynamicsList => dynamicsList;

  bool isLoadingRubDynamics = false;
  bool isRequestIsUnsuccessful = false;
  String errorDescrForCustomer = 'Error of loading dynamics of EUR data form the server';

  void getRubDynamics(context) async {
    isLoadingRubDynamics = true;
    dynamicsList = await getRubDynamicsData();
    isLoadingRubDynamics = false;

    notifyListeners();
  }

  Future<List<Dynamics>> getRubDynamicsData() async {
    late List<Dynamics> rubDynamicsData;

    await getCurDynamicsForAYear(curId: 298).then((dynamicsData) {
      if (dynamicsData.isNotEmpty) {
        rubDynamicsData = dynamicsData;
      } else {
        errorDescrForCustomer =
        'The Bank doesn\'t provide dynamics of RUB for this date';
        isRequestIsUnsuccessful = true;
      }
    }, onError: (er) {
      isRequestIsUnsuccessful = true;
    }).catchError((error) {
      throw Exception('Error of loading dynamics of RUB form the server');
    });
    isLoadingRubDynamics = false;

    return rubDynamicsData;
  }
}
