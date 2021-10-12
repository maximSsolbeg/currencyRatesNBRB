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

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      Cur_ID: json['Cur_ID'] ?? 0,
      Date: json['Date'] ?? '',
      Cur_Abbreviation: json['Cur_Abbreviation'] ?? '',
      Cur_Scale: json['Cur_Scale'] ?? 0,
      Cur_Name: json['Cur_Name'] ?? '',
      Cur_OfficialRate: json['Cur_OfficialRate'] ?? 0,
    );
  }
}
