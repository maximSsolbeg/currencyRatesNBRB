import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:currency_rates/networking/metals_dynamics_api.dart';
import 'package:flutter/widgets.dart';

class GoldDynamicsProvider with ChangeNotifier {
  late List<Dynamics> dynamicsList;
  List get getGoldDynamicsList => dynamicsList;

  bool isLoadingGoldDynamics = false;
  bool isRequestIsUnsuccessful = false;
  String errorDescrForCustomer = 'Error of loading dynamics of Gold rate data form the server';

  void getGoldDynamics(context) async {
    isLoadingGoldDynamics = true;
    dynamicsList = await getGoldDynamicsData();
    isLoadingGoldDynamics = false;

    notifyListeners();
  }

  Future<List<Dynamics>> getGoldDynamicsData() async {
    late List<Dynamics> goldDynamicsData;

    await getMetalDynamicsForAYear(metalId: 0).then((dynamicsData) {
      if (dynamicsData.isNotEmpty) {
        goldDynamicsData = dynamicsData;
      } else {
        errorDescrForCustomer =
        'The Bank doesn\'t provide dynamics of EUR for this date';
        isRequestIsUnsuccessful = true;
      }
    }, onError: (er) {
      isRequestIsUnsuccessful = true;
    }).catchError((error) {
      throw Exception('Error of loading dynamics of Gold rate data form the server');
    });
    isLoadingGoldDynamics = false;

    return goldDynamicsData;
  }
}
