class ThingSpeakFields {
  double humidity;
  double temperature;
  double xcoord;
  double ycoord;
  double gasComp;

  ThingSpeakFields({
    required this.humidity,
    required this.temperature,
    required this.xcoord,
    required this.ycoord,
    required this.gasComp,
  });

  factory ThingSpeakFields.fromJson(Map<String, dynamic> json) {
    return ThingSpeakFields(
      humidity: double.parse(json['field1'] ?? '0.0'),
      temperature: double.parse(json['field2'] ?? '0.0'),
      xcoord: double.parse(json['field3'] ?? '0.0'),
      ycoord: double.parse(json['field4'] ?? '0.0'),
      gasComp: double.parse(json['field5'] ?? '0.0'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'field1': humidity,
      'field2': temperature,
      'field3': xcoord,
      'field4': ycoord,
      'field5': gasComp,
    };
  }
}
