import 'package:currency_rates/models/currency_info_mdl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//request for currency info WITHOUT rates
Future<List<CurrencyInfo>> getCurrenciesInfo() async {
  const curInfoUrl = 'https://www.nbrb.by/api/exrates/currencies';
  final response = await http.get(Uri.parse(curInfoUrl));

  if (response.statusCode == 200) {
    List decodedData = json.decode(response.body);

    final List<CurrencyInfo> currenciesInfo = decodedData
        .map((currencyInfo) => CurrencyInfo.fromJson(currencyInfo)).toList();

    return currenciesInfo;
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
