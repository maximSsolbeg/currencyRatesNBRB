import 'package:currency_rates/models/metal_mdl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:currency_rates/common/format_date.dart';

Future<List<Metal>> getCurrentMetalsRates() async {
  //TODO: change request URL
  var today = FormatDateForUrl(DateTime.now().toString());
  String currentMetalsRatesURL = 'https://www.nbrb.by/api/bankingots/prices?startdate=$today&enddate=$today';

  final response = await http.get(Uri.parse(currentMetalsRatesURL));

  if(response.statusCode == 200) {
    List decodedData = json.decode(response.body);
    final List<Metal> currentMetalsRates = decodedData
        .map((metal) => Metal.fromJson(metal)).toList();

    return currentMetalsRates;
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

// dynamic _checkIfListIsEmpty(metalsList) {
//   // print('metalsList.isEmpty: ${metalsList.isEmpty}');
//   // print('metalsList.length: ${metalsList.length}');
//
//   if(metalsList.isEmpty || metalsList.length != 4){
//     metalsList.add(Metal(Date: '-', Value: 0.0, MetalId: 0));
//   }
//
//   return metalsList;
// }

Future<dynamic> getMetalsRates() async{
  late dynamic notEmptyMetalsList;

  await getCurrentMetalsRates()
      .then((metalsList) {
  // print('metalsList.isEmpty: ${metalsList.isEmpty}');
  // print('metalsList.length: ${metalsList.length}');
    if(metalsList.isEmpty || metalsList.length != 4){
        metalsList.add(Metal(Date: '-', Value: 0.0, MetalId: 0));
    }

    return metalsList;
  })
      .catchError((error) {
        throw Exception('Some arbitrary error');
      }

  );

  // print('outer notEmptyMetalsList: $metalsList');
  // return notEmptyMetalsList;
}
