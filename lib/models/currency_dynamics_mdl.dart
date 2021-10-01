class CurrencyDynamics {
  final String Date;
  final double Cur_OfficialRate;

  CurrencyDynamics({
    required this.Date,
    required this.Cur_OfficialRate
  });

  factory CurrencyDynamics.fromJson(Map<String, dynamic> json) {
    return CurrencyDynamics(
      Date: json['Date'] ?? '',
      Cur_OfficialRate: json['Cur_OfficialRate'] ?? 0,
    );
  }
}
