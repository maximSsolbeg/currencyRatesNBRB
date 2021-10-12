class RefinancingRate {
  final int? Cur_ID;
  final String Date;
  final double? Value;

  RefinancingRate(
      {this.Cur_ID, required this.Date, this.Value});

  factory RefinancingRate.fromJson(Map<String, dynamic> json) {
    return RefinancingRate(
      Cur_ID: json['Cur_ID'],
      Date: json['Date'],
      Value: json['Value'],
    );
  }
}
