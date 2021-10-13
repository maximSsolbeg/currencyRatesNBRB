class CurrencyInfo {
  final int Cur_ID;
  final String Cur_Abbreviation;
  final String Cur_Name; //ru
  final String Cur_Name_Eng;
  final String Cur_Name_Bel;

  CurrencyInfo({
    required this.Cur_ID,
    required this.Cur_Abbreviation,
    required this.Cur_Name,
    required this.Cur_Name_Eng,
    required this.Cur_Name_Bel,
  });

  factory CurrencyInfo.fromJson(Map<String, dynamic> json) {
    return CurrencyInfo(
      Cur_ID: json['Cur_ID'] ?? 0,
      Cur_Abbreviation: json['Cur_Abbreviation'] ?? '',
      Cur_Name: json['Cur_Name'] ?? '',
      Cur_Name_Eng: json['Cur_Name_Eng'] ?? '',
      Cur_Name_Bel: json['Cur_Name_Bel'] ?? '',
    );
  }
}
