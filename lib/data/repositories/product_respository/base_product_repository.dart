import 'package:flutter/services.dart';

import '../../models/models.dart';
import '../../../utils/utils.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> loadProducts();

  Future<void> createProduct({
    required String name,
    required Uint8List image,
    required String category,
    required double price,
    required double? salePrice,
    required MeasureUnit measureUnit,
  });

  Future<void> updateProduct({
    required String id,
    required String? name,
    required String oldImageUrl,
    required Uint8List? newImage,
    required String? category,
    required double? price,
    required double? salePrice,
    required MeasureUnit? measureUnit,
  });
}
