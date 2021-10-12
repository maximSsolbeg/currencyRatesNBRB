class Dynamics {
  final int? Cur_ID;
  final String Date;
  final double? Cur_OfficialRate;
  final double? Value;

  Dynamics({
    this.Cur_ID,
    required this.Date,
    this.Cur_OfficialRate,
    this.Value
  });

  factory Dynamics.fromJson(Map<String, dynamic> json) {
    return Dynamics(
      Cur_ID: json['Cur_ID'],
      Date: json['Date'],
      Cur_OfficialRate: json['Cur_OfficialRate'],
      Value: json['Value'],
    );
  }
}
