import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseStoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Create user profile in Firestore
  Future<String?> createProfile({
    required String firstName,
    required String lastName,
  }) async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        return 'User not logged in';
      }

      await _db.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'firstName': firstName,
        'lastName': lastName,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return null;

    } on FirebaseException catch (e) {
      print("Firebase Exception: ${e.code} - ${e.message}");
      return e.message;
    } catch (e) {
      print("Unknown error: $e");
      return 'Something went wrong. Please try again later';
    }
  }
}
