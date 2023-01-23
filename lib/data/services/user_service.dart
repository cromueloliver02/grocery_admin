import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/models.dart';
import '../../utils/utils.dart';

class UserService {
  final FirebaseFirestore firestore;

  UserService({
    required this.firestore,
  });

  Future<DocumentSnapshot> getUser(String userId) async {
    try {
      final DocumentSnapshot userDoc =
          await firestore.collection(kUsersCollectionPath).doc(userId).get();

      if (!userDoc.exists) {
        throw GCRError.exception('User does not exist');
      }

      return userDoc;
    } on GCRError {
      rethrow;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }
}
