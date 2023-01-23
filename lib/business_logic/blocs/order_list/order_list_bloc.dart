import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'order_list_event.dart';
part 'order_list_state.dart';

class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {
  final OrderRepository orderRepository;

  OrderListBloc({
    required this.orderRepository,
  }) : super(OrderListState.initial()) {
    on<OrderListStarted>(_onOrderListStarted);
  }

  void _onOrderListStarted(
    OrderListStarted event,
    Emitter<OrderListState> emit,
  ) async {
    try {
      emit(state.copyWith(status: () => OrderListStatus.loading));

      await emit.forEach<List<OrderItem>>(
        orderRepository.fetchOrders(),
        onData: (List<OrderItem> orderItems) {
          final List<OrderItem> newOrderItems = orderItems
            ..sort((OrderItem a, OrderItem b) =>
                b.createdAt.compareTo(a.createdAt));

          return state.copyWith(
            status: () => OrderListStatus.success,
            order: () => Order(orderItems: List<OrderItem>.from(newOrderItems)),
          );
        },
        onError: _onError,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => OrderListStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  OrderListState _onError(Object err, StackTrace stacktrace) {
    if (err is GCRError) {
      logError(state, err);

      return state.copyWith(
        status: () => OrderListStatus.failure,
        error: () => err,
      );
    }

    if (err is firestore.FirebaseException) {
      logError(state, GCRError.firebaseException(err));

      return state.copyWith(
        status: () => OrderListStatus.failure,
        error: () => GCRError.firebaseException(err),
      );
    }

    logError(
      state,
      GCRError.exception(err, stackTrace: stacktrace),
    );

    return state.copyWith(
      status: () => OrderListStatus.failure,
      error: () => GCRError.exception(err),
    );
  }
}
