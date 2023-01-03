import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository productRepository;

  ProductListBloc({
    required this.productRepository,
  }) : super(ProductListState.initial()) {
    on<ProductListStarted>(_onProductListStarted);
    on<ProductListUpdated>(_onProductListUpdated);
  }

  void _onProductListStarted(
    ProductListStarted event,
    Emitter<ProductListState> emit,
  ) {
    productRepository.loadProducts().listen((productList) {
      add(ProductListUpdated(productList: productList));
    });
  }

  void _onProductListUpdated(
    ProductListUpdated event,
    Emitter<ProductListState> emit,
  ) {
    emit(state.copyWith(productList: event.productList));
  }
}
