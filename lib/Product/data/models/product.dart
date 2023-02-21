import 'dart:convert';

import 'rating.dart';

class Product {
  final String name;
  final String desc;
  final num price;
  final int quantity;
  final String category;
  final List<String> images;
  final String? id;
  //final String? userId;
  final List<Rating>? ratings;

  Product({
    required this.name,
    required this.desc,
    required this.price,
    required this.quantity,
    required this.category,
    this.images = const [],
    this.id,
    this.ratings,
    //this.userId,
  });

  Product copyWith({
    String? id,
    String? name,
    String? desc,
    num? price,
    int? quantity,
    String? category,
    List<String>? images,
    //String? userId,
  }) {
    return Product(
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      images: images ?? this.images,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'quantity': quantity,
      'category': category,
      'images': images,
      'rating': ratings,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'],
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      quantity: map['quantity'] as int,
      category: map['category'] as String,
      images: (map['images'] as List<dynamic>)
          .map((image) => image.toString())
          .toList(),
      ratings: map['ratings'] != null
          ? List<Rating>.from(map['ratings']?.map((x) => Rating.fromMap(x)))
          : null,
    );
  }

  double? get getTotalRating {
    const num initval = 0;
    
    return (ratings != null ? ratings!.fold(initval, (previousValue, element) => element.rating + double.parse(previousValue.toString())) : 0) / (ratings != null && ratings!.isNotEmpty ? ratings!.length : 1);}

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(name: $name, desc: $desc, price: $price, quantity: $quantity, category: $category, images: $images)';
  }
}
