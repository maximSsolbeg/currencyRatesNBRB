import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:currency_rates/networking/metals_dynamics_api.dart';
import 'package:flutter/widgets.dart';

class PalladiumDynamicsProvider with ChangeNotifier {
  late List<Dynamics> dynamicsList;
  List get getPalladiumDynamicsList => dynamicsList;

  bool isLoadingPalladiumDynamics = false;
  bool isRequestIsUnsuccessful = false;
  String errorDescrForCustomer = 'Error of loading dynamics of Palladium rate data form the server';

  void getPalladiumDynamics(context) async {
    isLoadingPalladiumDynamics = true;
    dynamicsList = await getPalladiumDynamicsData();
    isLoadingPalladiumDynamics = false;

    notifyListeners();
  }

  Future<List<Dynamics>> getPalladiumDynamicsData() async {
    late List<Dynamics> palladiumDynamicsData;

    await getMetalDynamicsForAYear(metalId: 3).then((dynamicsData) {
      if (dynamicsData.isNotEmpty) {
        palladiumDynamicsData = dynamicsData;
      } else {
        errorDescrForCustomer =
        'The Bank doesn\'t provide dynamics of EUR for this date';
        isRequestIsUnsuccessful = true;
      }
    }, onError: (er) {
      isRequestIsUnsuccessful = true;
    }).catchError((error) {
      throw Exception('Error of loading dynamics of Palladium rate data form the server');
    });
    isLoadingPalladiumDynamics = false;

    return palladiumDynamicsData;
  }
}
