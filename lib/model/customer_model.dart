import 'address_model.dart';

class Customer {
  String name;
  String roles;
  String phoneNum;
  Address address;

  Customer(
      {required this.name,
      required this.roles,
      required this.phoneNum,
      required this.address});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: json['name'],
      roles: json['roles'],
      phoneNum: json['phoneNum'],
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'roles': roles,
      'phoneNum': phoneNum,
      'address': address,
    };
  }
}
