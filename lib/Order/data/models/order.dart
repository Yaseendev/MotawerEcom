// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce/Product/data/models/product.dart';

class Order {
  final String id;
  final List<Product> products;
  final List<int> quantites;
  final String address;
  final String userID;
  final DateTime orderedAt;
  final String status;
  Order({
    required this.id,
    required this.products,
    required this.quantites,
    required this.address,
    required this.userID,
    required this.orderedAt,
    required this.status,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'quantites': quantites,
      'address': address,
      'userID': userID,
      'orderedAt': orderedAt.millisecondsSinceEpoch,
      'status': status,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as String,
      products: List<Product>.from((map['products'] as List<int>).map<Product>((x) => Product.fromMap(x as Map<String,dynamic>),),),
      quantites: List<int>.from((map['quantites'] as List<int>)),
      address: map['address'] as String,
      userID: map['userID'] as String,
      orderedAt: DateTime.fromMillisecondsSinceEpoch(map['orderedAt'] as int),
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
