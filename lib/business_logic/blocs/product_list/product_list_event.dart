part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class ProductListStarted extends ProductListEvent {}

class ProductListUpdated extends ProductListEvent {
  final List<Product> productList;

  const ProductListUpdated({
    required this.productList,
  });

  @override
  List<Object> get props => [productList];
}
