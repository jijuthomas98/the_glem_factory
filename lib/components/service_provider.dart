import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServiceProvider with ChangeNotifier {
  String subPackage;
  ServiceProvider({this.subPackage});

  //Stream of services
  Stream<QuerySnapshot> getStreamServices() {
    return FirebaseFirestore.instance.collection('services').snapshots();
  }

  // Stream of Packages
  Stream<QuerySnapshot> getStreamPackage(String package) {
    return FirebaseFirestore.instance
        .collection('/services/$package/$subPackage')
        .snapshots();
  }
}
