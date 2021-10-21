class Currency {
  final int Cur_ID;
  final String Date;
  final String Cur_Abbreviation;
  final int Cur_Scale;
  final double Cur_OfficialRate;
  final String Cur_Name; //ru
  final String? Cur_Name_Eng;
  final String? Cur_Name_Bel;

  Currency({
    required this.Cur_ID,
    required this.Date,
    required this.Cur_Abbreviation,
    required this.Cur_Scale,
    required this.Cur_OfficialRate,
    required this.Cur_Name,
    this.Cur_Name_Eng,
    this.Cur_Name_Bel,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      Cur_ID: json['Cur_ID'] ?? 0,
      Date: json['Date'] ?? '',
      Cur_Abbreviation: json['Cur_Abbreviation'] ?? '',
      Cur_Scale: json['Cur_Scale'] ?? 0,
      Cur_OfficialRate: json['Cur_OfficialRate'] ?? 0,
      Cur_Name: json['Cur_Name'] ?? '',
      Cur_Name_Eng: json['Cur_Name_Eng'] ?? '',
      Cur_Name_Bel: json['Cur_Name_Bel'] ?? '',
    );
  }
}
