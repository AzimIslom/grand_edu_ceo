import 'package:firebase_auth/firebase_auth.dart';

import '../utils/utils.dart';

final _auth = FirebaseAuth.instance;
final auth = AuthService.instance;

class AuthService {
  AuthService._();

  static AuthService instance = AuthService._();

  Stream<User?> stream() => _auth.userChanges();

  String get id => _auth.currentUser!.uid;

  Future<String?> signIn(String tel, String password) async {
    try {
      print('998$tel@ceo.com');
      print(password);
      await _auth.signInWithEmailAndPassword(
        email: '998$tel@ceo.com',
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return myErrors.userNotFound;
      } else if (e.code == 'wrong-password') {
        return myErrors.wrongPassword;
      } else {
        return myErrors.unknownError;
      }
    } catch (e) {
      print('signIn: $e');
      return myErrors.unknownError;
    }
  }

  Future<String?> signUp(String tel, String password, String end) async {
    try {
      print('998$tel@$end.com');
      print(password);
      await _auth.createUserWithEmailAndPassword(
        email: '998$tel@$end.com',
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return myErrors.userNotFound;
      } else if (e.code == 'wrong-password') {
        return myErrors.wrongPassword;
      } else {
        return myErrors.unknownError;
      }
    } catch (e) {
      print('signIn: $e');
      return myErrors.unknownError;
    }
  }

  void signOut() {
    _auth.signOut();
  }
}
