import 'dart:io';
import 'package:flutter/material.dart';
import 'package:currency_rates/models/currency_mdl.dart';
import 'package:currency_rates/models/refinancing_rate_mdl.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

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

// Future<List<Currency>> getAllCurRatesData() async {
//   RefinancingRate allCurRatesList;
//
//   try {
//     final response = await http.get(
//       Uri.parse('https://www.nbrb.by/api/exrates/rates?periodicity=0'),
//       headers: {
//         HttpHeaders.contentTypeHeader: 'application/json',
//       },
//     );
//     if (response.statusCode == 200) {
//       List decodedData = json.decode(response.body);
//
//       final List<Currency> allCurRatesList = decodedData
//           .map((currency) => Currency.fromJson(currency)).toList();
//
//       return allCurRatesList;
//     } else {
//       Fluttertoast.showToast(
//           msg: "Data not found",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 2,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0
//       );
//       return null;
//     }
//   } on SocketException {
//     return null;
//   }
// }
