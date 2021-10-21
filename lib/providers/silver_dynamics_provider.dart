import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:currency_rates/networking/metals_dynamics_api.dart';
import 'package:flutter/widgets.dart';

class SilverDynamicsProvider with ChangeNotifier {
  late List<Dynamics> dynamicsList;
  List get getSilverDynamicsList => dynamicsList;

  bool isLoadingSilverDynamics = false;
  bool isRequestIsUnsuccessful = false;
  String errorDescrForCustomer = 'Error of loading dynamics of Silver rate data form the server';

  void getSilverDynamics(context) async {
    isLoadingSilverDynamics = true;
    dynamicsList = await getSilverDynamicsData();
    isLoadingSilverDynamics = false;

    notifyListeners();
  }

  Future<List<Dynamics>> getSilverDynamicsData() async {
    late List<Dynamics> silverDynamicsData;

    await getMetalDynamicsForAYear(metalId: 1).then((dynamicsData) {
      if (dynamicsData.isNotEmpty) {
        silverDynamicsData = dynamicsData;
      } else {
        errorDescrForCustomer =
        'The Bank doesn\'t provide dynamics of EUR for this date';
        isRequestIsUnsuccessful = true;
      }
    }, onError: (er) {
      isRequestIsUnsuccessful = true;
    }).catchError((error) {
      throw Exception('Error of loading dynamics of Silver rate data form the server');
    });
    isLoadingSilverDynamics = false;

    return silverDynamicsData;
  }
}
