part of 'product_cubit.dart';

class ProductState extends Equatable {
  final ProductStatus status;
  final GCRError error;

  const ProductState({
    required this.status,
    required this.error,
  });

  factory ProductState.initial() {
    return const ProductState(
      status: ProductStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'ProductState(status: $status, error: $error)';

  ProductState copyWith({
    ProductStatus? status,
    GCRError? error,
  }) {
    return ProductState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
