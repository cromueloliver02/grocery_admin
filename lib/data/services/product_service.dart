import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

const _uuid = Uuid();

class ProductService {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  ProductService({
    required this.firestore,
    required this.storage,
  });

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
          storage.ref('product_images/${_uuid.v4()}.jpg');

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

      await firestore.collection(kProductsCollectionPath).doc().set(payload);
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
