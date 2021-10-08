import 'package:currency_rates/models/metal_mdl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:currency_rates/common/format_date.dart';

Future<List<Metal>> getCurrentMetalsRates() async {
  var today = FormatDate(DateTime.now().toString());

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
