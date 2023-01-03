import 'dart:typed_data';

import '../../../data/services/product_service.dart';
import '../../../utils/utils.dart';

import 'base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final ProductService productService;

  ProductRepository({
    required this.productService,
  });

  @override
  Future<void> postProduct({
    required String name,
    required Uint8List image,
    required String category,
    required double price,
    required double? salePrice,
    required MeasureUnit measureUnit,
  }) async {
    try {
      await productService.postProduct(
        name: name,
        image: image,
        category: category,
        price: price,
        salePrice: salePrice,
        measureUnit: measureUnit,
      );
    } catch (err) {
      rethrow;
    }
  }
}
