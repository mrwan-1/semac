// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:she_mec/auth/login/login.dart';
import 'package:she_mec/auth/widgets/text_from_field.dart';

import '../../core/widgets/primary_botton.dart';

class FristRegstr extends StatefulWidget {
  const FristRegstr({super.key});

  @override
  State<FristRegstr> createState() => _FristRegstrState();
}

class _FristRegstrState extends State<FristRegstr> {
  
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var user = FirebaseAuth.instance.currentUser;
  String? name;
  addUser() {
    users.add({
      "userid": user,
      "name": name,
      "phoneNumber": user!.phoneNumber,
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return const LOGIN();
                },
              ), (route) => false);
            },
            icon: const Icon(Icons.logout)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Textfild(password: false, numSmoL: 2, numBeg: 9),
           Textfild(password: false, numSmoL: 2, numBeg: 9),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 9,vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 400,
              width: size.width / 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                onPressed: () {  },
                 text: 'حفظ ',),
            )
          ],
        ),
      ),
    );
  }
}
