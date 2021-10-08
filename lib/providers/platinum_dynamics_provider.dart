import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:currency_rates/networking/metals_dynamics_api.dart';
import 'package:flutter/widgets.dart';

class PlatinumDynamicsProvider with ChangeNotifier {
  late List<Dynamics> dynamicsList;
  List get getPlatinumDynamicsList => dynamicsList;

  bool isLoadingPlatinumDynamics = false;
  bool isRequestIsUnsuccessful = false;
  String errorDescrForCustomer = 'Error of loading dynamics of Platinum rate data form the server';

  void getPlatinumDynamics(context) async {
    isLoadingPlatinumDynamics = true;
    dynamicsList = await getPlatinumDynamicsData();
    isLoadingPlatinumDynamics = false;

    notifyListeners();
  }

  Future<List<Dynamics>> getPlatinumDynamicsData() async {
    late List<Dynamics> platinumDynamicsData;

    await getMetalDynamicsForAYear(metalId: 2).then((dynamicsData) {
      if (dynamicsData.isNotEmpty) {
        platinumDynamicsData = dynamicsData;
      } else {
        errorDescrForCustomer =
        'The Bank doesn\'t provide dynamics of EUR for this date';
        isRequestIsUnsuccessful = true;
      }
    }, onError: (er) {
      isRequestIsUnsuccessful = true;
    }).catchError((error) {
      throw Exception('Error of loading dynamics of Platinum rate data form the server');
    });
    isLoadingPlatinumDynamics = false;

    return platinumDynamicsData;
  }
}
