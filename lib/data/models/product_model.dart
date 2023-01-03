import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../utils/utils.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String category;
  final double price;
  final double? salePrice;
  final MeasureUnit measureUnit;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    this.salePrice,
    required this.measureUnit,
  });

  bool get isOnSale => salePrice != null;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      imageUrl,
      category,
      price,
      salePrice,
      measureUnit,
    ];
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, imageUrl: $imageUrl, category: $category, price: $price, salePrice: $salePrice, measureUnit: $measureUnit)';
  }

  Product copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? category,
    double? price,
    double? salePrice,
    MeasureUnit? measureUnit,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      measureUnit: measureUnit ?? this.measureUnit,
    );
  }

  factory Product.fromDoc(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;

    return Product(
      id: doc.id,
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      salePrice: map['salePrice']?.toDouble(),
      measureUnit:
          MeasureUnit.values.firstWhere((d) => d.name == map['measureUnit']),
    );
  }
}
