part of 'order_list_bloc.dart';

class OrderListState extends Equatable {
  final Order order;
  final OrderListStatus status;
  final GCRError error;

  const OrderListState({
    required this.order,
    required this.status,
    required this.error,
  });

  factory OrderListState.initial() {
    return OrderListState(
      order: Order.initial(),
      status: OrderListStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [order, status, error];

  @override
  String toString() =>
      'OrderListState(order: $order, status: $status, error: $error)';

  OrderListState copyWith({
    Order Function()? order,
    OrderListStatus Function()? status,
    GCRError Function()? error,
  }) {
    return OrderListState(
      order: order != null ? order() : this.order,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
