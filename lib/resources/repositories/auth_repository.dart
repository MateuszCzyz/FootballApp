import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  AuthenticationRepository(
      {FirebaseAuth firebaseAuth,
      FirebaseFirestore firestore,
      GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<void> signInWithEmailAndPassword(
      {String email, String password}) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount _googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleSignInAuth =
          await _googleSignInAccount.authentication;
      AuthCredential _authCredential = GoogleAuthProvider.credential(
          idToken: _googleSignInAuth.idToken,
          accessToken: _googleSignInAuth.accessToken);
      await _firebaseAuth.signInWithCredential(_authCredential);
    } on PlatformException catch (e) {}
  }

  Future<void> createUserWithEmailAndPassoword(
      {String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> updateUserAccount({String displayName, String imageURL}) async {
    return await _firebaseAuth.currentUser
        .updateProfile(displayName: displayName, photoURL: imageURL);
  }

  Future<void> updateUserEmail({String email}) async {
    return await _firebaseAuth.currentUser.updateEmail(email);
  }

  Future<void> updateUserPassword({String password}) async {
    return await _firebaseAuth.currentUser.updatePassword(password);
  }

  User getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  bool isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }
}
