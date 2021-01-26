import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  String userName = '';
  String phoneNo = '';
  String address = '';
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user.uid;
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user.uid;
  }

  String currentUser() {
    User user = FirebaseAuth.instance.currentUser;
    return user.uid;
  }

  String currentUserPhoneNo() {
    User user = FirebaseAuth.instance.currentUser;
    return user.phoneNumber;
  }

  String currentUserEmail() {
    User user = FirebaseAuth.instance.currentUser;
    return user.email;
  }

  Future<String> signInAnonymously() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    return userCredential.user.uid;
  }

  onAuthStateChange() {
    return FirebaseAuth.instance.authStateChanges();
  }

  Future signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  void registerUserData({String fullName, email, password, phoneNo, address}) {
    FirebaseFirestore.instance.collection('userData').doc(currentUser()).set({
      'fullName': fullName,
      'email': email,
      'password': password,
      'phoneNo': phoneNo,
      'address': address,
    });
  }

  void updateUserDate({String name, phoneNo, address}) {
    FirebaseFirestore.instance
        .collection('userData')
        .doc(currentUser())
        .update({
      'address': address,
      'fullName': name,
      'phoneNo': phoneNo,
    });
  }

  Future<String> getUserData() async {
    DocumentSnapshot users = await FirebaseFirestore.instance
        .collection('userData')
        .doc(currentUser())
        .get();
    userName = users['fullName'];
    phoneNo = users['phoneNo'];
    address = users['address'];
  }
}
