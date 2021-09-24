class RefinancingRate {
  final String Date;
  final double Value;

  RefinancingRate({required this.Date, required this.Value});

  factory RefinancingRate.fromJson(Map<String, dynamic> json){
    return RefinancingRate(
        Date: json['Date'] ?? '',
        Value: json['Value'] ?? 0.00,
    );
  }
}
