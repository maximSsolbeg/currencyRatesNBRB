import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Dynamics>> getCurrentRefinancingRate() async {
  String currentRefRateURL = 'https://www.nbrb.by/api/refinancingrate';
  final response = await http.get(Uri.parse(currentRefRateURL));

  if(response.statusCode == 200) {
    List decodedData = json.decode(response.body);
    final List<Dynamics> refRateList = decodedData
        .map((ratePoint) => Dynamics.fromJson(ratePoint)).toList();

    return refRateList;
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
