import 'package:currency_rates/models/refinancing_rate_mdl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:currency_rates/common/format_date.dart';

Future<RefinancingRate> getCurrentRefinancingRate() async {
  var today = FormatDate(DateTime.now().toString());

  String currentRefRateURL = 'https://www.nbrb.by/api/refinancingrate?ondate=$today';
  final response = await http.get(Uri.parse(currentRefRateURL));

  if(response.statusCode == 200) {
    List currentRefRateList = json.decode(response.body);
    final RefinancingRate currentRefRate = RefinancingRate.fromJson(currentRefRateList[0]);

    return currentRefRate;
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
