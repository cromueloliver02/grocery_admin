import 'dart:typed_data';

import '../../../data/services/services.dart';
import '../../../data/models/models.dart';
import '../../../utils/utils.dart';
import './base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final ProductService productService;

  ProductRepository({
    required this.productService,
  });

  @override
  Stream<List<Product>> loadProducts() {
    return productService.loadProducts();
  }

  @override
  Future<void> createProduct({
    required String name,
    required Uint8List image,
    required String category,
    required double price,
    required double? salePrice,
    required MeasureUnit measureUnit,
  }) async {
    try {
      await productService.createProduct(
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

  @override
  Future<void> updateProduct({
    required String id,
    required String? name,
    required String oldImageUrl,
    required Uint8List? newImage,
    required String? category,
    required double? price,
    required double? salePrice,
    required MeasureUnit? measureUnit,
  }) async {
    try {
      await productService.updateProduct(
        id: id,
        name: name,
        oldImageUrl: oldImageUrl,
        newImage: newImage,
        category: category,
        price: price,
        salePrice: salePrice,
        measureUnit: measureUnit,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    try {
      await productService.deleteProduct(id);
    } catch (err) {
      rethrow;
    }
  }
}
