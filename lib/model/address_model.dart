class Address {
  String streetNum;
  String streetName;
  String distric;

  Address(
      {required this.streetName,
      required this.streetNum,
      required this.distric});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      streetName: json['streetName'],
      streetNum: json['streetNum'],
      distric: json['distric'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'streetName': streetName,
      'streetNum': streetNum,
      'distric': distric,
    };
  }
}
