import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthenticationRepository(
      {FirebaseAuth firebaseAuth, FirebaseFirestore firestore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> signInWithEmailAndPassword(
      {String email, String password}) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signInWithGoogle() async {}

  Future<void> createUserWithEmailAndPassoword(
      {String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  User getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  bool isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }
}
