import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {

      if (e.code == 'email-already-in-use') {
        return "This email is already registered.";
      }

      if (e.code == 'invalid-email') {
        return "Please enter a valid email.";
      }

      if (e.code == 'weak-password') {
        return "Password is too weak. Use at least 6 characters.";
      }

      return e.message;
    } catch (e) {
      return "Something went wrong. Please try again.";
    }
  }
}
