import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

class OrderService {
  final FirebaseFirestore firestore;

  OrderService({
    required this.firestore,
  });

  Stream<QuerySnapshot> fetchOrders() {
    try {
      final Stream<QuerySnapshot> orderQueryStream =
          firestore.collection(kOrdersCollectionPath).snapshots();

      return orderQueryStream;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }
}
