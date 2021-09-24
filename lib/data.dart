import 'package:flutter/widgets.dart';
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

class CurRatesProvider with ChangeNotifier{

  late List<Currency> allCurRatesList;
  List get getAllCurRatesList => allCurRatesList;

  late Currency usdData = allCurRatesList.singleWhere((item) {
    return item.Cur_Abbreviation == 'USD';
  });
  Currency get getUsdData => usdData;

  late Currency eurData = allCurRatesList.singleWhere((item) {
    return item.Cur_Abbreviation == 'EUR';
  });
  Currency get getEurData => eurData;

  late Currency rubData = allCurRatesList.singleWhere((item) {
    return item.Cur_Abbreviation == 'RUB';
  });
  Currency get getRubData => rubData;

  bool isLoadingCurRates = false;

  void getCurRates(context) async {
    isLoadingCurRates = true;
    allCurRatesList = await getAllCurRatesData();
    isLoadingCurRates = false;

    notifyListeners();
  }
}

class Currency {
  final int Cur_ID;
  final String Date;
  final String Cur_Abbreviation;
  final int Cur_Scale;
  final String Cur_Name;
  final double Cur_OfficialRate;

  Currency({
    required this.Cur_ID,
    required this.Date,
    required this.Cur_Abbreviation,
    required this.Cur_Scale,
    required this.Cur_Name,
    required this.Cur_OfficialRate
  });

  Currency.fromJson(Map<String, dynamic> json)
    : Cur_ID = json['Cur_ID'] as int,
     Date = json['Date'] as String,
     Cur_Abbreviation = json['Cur_Abbreviation'] as String,
     Cur_Scale = json['Cur_Scale'] as int,
     Cur_Name = json['Cur_Name'] as String,
     Cur_OfficialRate = json['Cur_OfficialRate'] as double;

  // factory Currency.fromJson(Map<String, dynamic> json) {
  //   return Currency(
  //     Cur_ID: json['Cur_ID'] as int,
  //     Date: json['Date'] as String,
  //     Cur_Abbreviation: json['Cur_Abbreviation'] as String,
  //     Cur_Scale: json['Cur_Scale'] as int,
  //     Cur_Name: json['Cur_Name'] as String,
  //     Cur_OfficialRate: json['Cur_OfficialRate'] as double,
  //   );
  // }
}

