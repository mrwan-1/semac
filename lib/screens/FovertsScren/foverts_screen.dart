// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FovertsScreen extends StatefulWidget {
  const FovertsScreen({super.key});

  @override
  State<FovertsScreen> createState() => _FovertsScreenState();
}

class _FovertsScreenState extends State<FovertsScreen> {

  Future addTofavourite() async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collecttionRef = 
    FirebaseFirestore.instance.collection('users_favourite-item');
    return _collecttionRef.doc(currentUser!.phoneNumber).collection('items').doc().set({
      "name":'widget._product[""]',
      "price":'widget._product[""]',
      "image":'widget._product[""]',
    }).then((value) => print("added to cart"));
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('المفضله'),
      ),
    );
  }
}