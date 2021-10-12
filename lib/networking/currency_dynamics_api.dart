import 'package:currency_rates/common/format_date.dart';
import 'package:currency_rates/models/dynamics_mdl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Dynamics>> getCurDynamicsForAYear({required int curId}) async {
  var today = FormatDateForUrl(DateTime.now().toString());
  var thisDayAYearBefore = FormatDateForUrl(DateTime.now().subtract(const Duration(days: 365)).toString());

  // var testURL = 'https://www.nbrb.by/API/ExRates/Rates/Dynamics/145?startDate=2022-10-05&endDate=2024-10-05';
  var curDynamicsForYearURL =
      'https://www.nbrb.by/API/ExRates/Rates/Dynamics/$curId?startDate=$thisDayAYearBefore&endDate=$today';

  final response = await http.get(Uri.parse(curDynamicsForYearURL));

  if(response.statusCode == 200) {
    List decodedData = json.decode(response.body);

    final List<Dynamics> curDynamicsList = decodedData
        .map((item) => Dynamics.fromJson(item)).toList();

    return curDynamicsList;
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
