import 'package:currency_rates/models/currency_mdl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Currency>> getAllCurRatesData() async {
  const allCurRatesURL = 'https://www.nbrb.by/api/exrates/rates?periodicity=0';
  final response = await http.get(Uri.parse(allCurRatesURL));

  if(response.statusCode == 200) {
    List decodedData = json.decode(response.body);

    final List<Currency> allCurRatesList = decodedData
        .map((currency) => Currency.fromJson(currency)).toList();

    return allCurRatesList;
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
