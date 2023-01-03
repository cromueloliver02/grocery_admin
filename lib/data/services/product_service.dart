import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

const _uuid = Uuid();

class ProductService {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  ProductService({
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
  })  : _firestore = firestore,
        _storage = storage;

  Stream<List<Product>> loadProducts() {
    return _firestore
        .collection(kProductsCollectionPath)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromDoc(doc)).toList();
    });
  }

  Future<void> postProduct({
    required String name,
    required Uint8List image,
    required String category,
    required double price,
    required double? salePrice,
    required MeasureUnit measureUnit,
  }) async {
    try {
      final Reference imageRef =
          _storage.ref('product_images/${_uuid.v4()}.jpg');

      await imageRef.putData(image);
      final String imageUrl = await imageRef.getDownloadURL();

      final Map<String, dynamic> payload = {
        'name': name,
        'imageUrl': imageUrl,
        'category': category,
        'price': price,
        'salePrice': salePrice,
        'measureUnit': measureUnit.name,
      };

      await _firestore.collection(kProductsCollectionPath).doc().set(payload);
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
