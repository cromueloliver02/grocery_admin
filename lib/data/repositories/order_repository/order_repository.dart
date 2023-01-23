import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';
import '../../services/services.dart';
import '../../../utils/utils.dart';
import 'base_order_repository.dart';

class OrderRepository extends BaseOrderRepository {
  final UserService userService;
  final OrderService orderService;

  OrderRepository({
    required this.userService,
    required this.orderService,
  });

  // @override
  // Stream<List<OrderItem>> fetchOrders() {
  //   try {
  //     final Stream<QuerySnapshot> orderQueryStream = orderService.fetchOrders();

  //     final Stream<List<OrderItem>> orderDocsStream = orderQueryStream.map(
  //       (snapshot) => snapshot.docs.map((doc) async {
  //         final List<CartItem> cartItems = [];

  //         final cartItemMaps =
  //             List<Map<String, dynamic>>.from(doc.get('cartItems'));

  //         for (final cartItemMap in cartItemMaps) {
  //           final String productId = cartItemMap['product'];

  //           final DocumentSnapshot productDoc = await FirebaseFirestore.instance
  //               .collection(kProductsCollectionPath)
  //               .doc(productId)
  //               .get();

  //           final Product product = Product.fromDoc(productDoc);

  //           final CartItem cartItem = CartItem.fromMap(
  //             cartItemMap,
  //             product: product,
  //           );

  //           cartItems.insert(0, cartItem);
  //         }

  //         return OrderItem.fromDoc(
  //           doc,
  //           cartItems: cartItems,
  //           user: User.initial(),
  //         );
  //       }).toList(),
  //     );

  //     return orderDocsStream;
  //   } catch (err) {
  //     rethrow;
  //   }
  // }

  @override
  Stream<List<OrderItem>> fetchOrders() async* {
    try {
      final Stream<QuerySnapshot> orderQueryStream = orderService.fetchOrders();

      await for (final QuerySnapshot orderSnapshot in orderQueryStream) {
        final List<OrderItem> orderItems = [];

        for (final QueryDocumentSnapshot orderItemDoc in orderSnapshot.docs) {
          final List<CartItem> cartItems = [];
          final cartItemMaps =
              List<Map<String, dynamic>>.from(orderItemDoc.get('cartItems'));

          for (final cartItemMap in cartItemMaps) {
            final String productId = cartItemMap['product'];

            final DocumentSnapshot productDoc = await FirebaseFirestore.instance
                .collection(kProductsCollectionPath)
                .doc(productId)
                .get();

            final Product product = Product.fromDoc(productDoc);
            final CartItem cartItem = CartItem.fromMap(
              cartItemMap,
              product: product,
            );

            cartItems.insert(0, cartItem);
          }

          final String userId = orderItemDoc.get('user');
          final DocumentSnapshot userDoc = await userService.getUser(userId);
          final User user = User.fromDoc(
            userDoc,
            wishlist: const <Product>[], // wishlist is unnecessary to populate
          );

          orderItems.insert(
            0,
            OrderItem.fromDoc(
              orderItemDoc,
              cartItems: cartItems,
              user: user,
            ),
          );
        }

        yield orderItems;
      }
    } catch (err) {
      rethrow;
    }
  }
}
