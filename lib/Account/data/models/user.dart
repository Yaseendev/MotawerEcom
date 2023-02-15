import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String address;

  @HiveField(4)
  final String type;

  // @HiveField(5)
  // final List<dynamic> cart;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.type,
   // required this.cart,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'address': address,
        'type': type,
        //'cart': cart,
      };

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
      //cart: List<Map<String, dynamic>>.from(map['cart']?.map((x) => Map<String, dynamic>.from(x))),
    );
  }
  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
