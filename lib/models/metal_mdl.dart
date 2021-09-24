class Metal {
  final String Date;
  final int MetalId;
  final double Value;

  Metal({
    required this.Date,
    required this.MetalId,
    required this.Value,
  });

  factory Metal.fromJson(Map<String, dynamic> json) {
    return Metal(
      Date: json['Date'] ?? '',
      MetalId: json['MetalId'] ?? 0,
      Value: json['Value'] ?? 0.0,
    );
  }
}
