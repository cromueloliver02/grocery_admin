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

  Future<void> createProduct({
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
      String? newImageUrl;

      if (newImage != null) {
        await _storage.refFromURL(oldImageUrl).delete();
        final Reference newImageRef =
            _storage.ref('product_images/${_uuid.v4()}.jpg');
        await newImageRef.putData(newImage);
        newImageUrl = await newImageRef.getDownloadURL();
      }

      final Map<String, dynamic> payload = {};
      if (name != null) payload.addAll({'name': name});
      if (newImageUrl != null) payload.addAll({'imageUrl': newImageUrl});
      if (category != null) payload.addAll({'category': category});
      if (price != null) payload.addAll({'price': price});
      if (salePrice != null) payload.addAll({'salePrice': salePrice});
      if (measureUnit != null) {
        payload.addAll({'measureUnit': measureUnit.name});
      }

      await _firestore
          .collection(kProductsCollectionPath)
          .doc(id)
          .update(payload);
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
