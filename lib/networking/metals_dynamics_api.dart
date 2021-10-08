import 'package:currency_rates/common/format_date.dart';
import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Dynamics>> getMetalDynamicsForAYear({required int metalId}) async {

  var goldDynamicsForYearURL =
      'https://www.nbrb.by/api/bankingots/prices/$metalId?startdate=$thisDayAYearBefore&enddate=$today';

  final response = await http.get(Uri.parse(goldDynamicsForYearURL));

  if(response.statusCode == 200) {
    List decodedData = json.decode(response.body);

    final List<Dynamics> goldDynamicsList = decodedData
        .map((item) => Dynamics.fromJson(item)).toList();

    return goldDynamicsList;
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
