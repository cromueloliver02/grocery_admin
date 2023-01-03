import 'package:flutter/services.dart';

import '../../models/models.dart';
import '../../../utils/utils.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> loadProducts();

  Future<void> postProduct({
    required String name,
    required Uint8List image,
    required String category,
    required double price,
    required double? salePrice,
    required MeasureUnit measureUnit,
  });
}
