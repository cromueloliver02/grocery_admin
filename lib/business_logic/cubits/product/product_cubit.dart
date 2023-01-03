import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRespository;

  ProductCubit({
    required this.productRespository,
  }) : super(ProductState.initial());

  void postProduct({
    required String name,
    required Uint8List image,
    required String category,
    required double price,
    required double? salePrice,
    required MeasureUnit measureUnit,
  }) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      await productRespository.postProduct(
        name: name,
        image: image,
        category: category,
        price: price,
        salePrice: salePrice,
        measureUnit: measureUnit,
      );

      emit(state.copyWith(status: ProductStatus.success));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: ProductStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}
