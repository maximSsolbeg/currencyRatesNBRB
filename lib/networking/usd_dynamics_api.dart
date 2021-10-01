import 'package:currency_rates/common/format_date.dart';
import 'package:currency_rates/models/currency_dynamics_mdl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<CurrencyDynamics>> getUsdDynamicsForAYear() async {
  var today = FormatDate(DateTime.now().toString());
  var thisDayAYearBefore = FormatDate(DateTime.now().subtract(const Duration(days: 365)).toString());

  var usdDynamicsForYearURL =
      'https://www.nbrb.by/API/ExRates/Rates/Dynamics/145?startDate=$thisDayAYearBefore&endDate=$today';

  final response = await http.get(Uri.parse(usdDynamicsForYearURL));

  if(response.statusCode == 200) {
    List decodedData = json.decode(response.body);

    final List<CurrencyDynamics> usdDynamicsList = decodedData
        .map((item) => CurrencyDynamics.fromJson(item)).toList();

    return usdDynamicsList;
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
