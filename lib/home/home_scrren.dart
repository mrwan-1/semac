// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:she_mec/auth/regestr/frist_regestr.dart';
import 'package:she_mec/drawer/drawer.dart';
import 'package:she_mec/screens/welcome/welcome_one.dart';

import '../config.dart';
import '../screens/notifications/notifications.dart';
import 'home_body.dart';

class HomeScrren extends StatefulWidget {
  HomeScrren({super.key});
  int currentPage = 0;
  @override
  State<HomeScrren> createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScrren> {
  final GlobalKey<ScaffoldState> _keydrawer = GlobalKey();
 login(){
  FirebaseAuth.instance.currentUser;
 }
 @override
  void initState() {
    login();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MyDrawer(),
      key: _keydrawer,
      backgroundColor: Ktitle,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Ktitle,
        centerTitle: true,
        title: Image.asset(
          'assets/images/sheimage.png',
          height: 110,
        ),
        leading:  Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              //  border: Border.all(width: 1,color: Colors.black),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Notifications();
                  },));
                },
                icon: const Icon(
                  Icons.notifications,
                  size: 38,
                  color: Colors.black,
                )),
          ),
        actions: [
         IconButton(onPressed: (){
          bool islogin;
          var user = FirebaseAuth.instance.currentUser;
          if (user == null) {
            islogin = false;
          }else{
            islogin = true;
          }
          Get.to(islogin == false ? const WelcomeOne() : const FristRegstr());
         }, icon: const Icon(Icons.account_circle_outlined,size: 30,color: Colors.black,)),
          Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            //  border: Border.all(width: 1,color: Colors.black),
          ),
          child: IconButton(
              onPressed: () {
                _keydrawer.currentState?.openEndDrawer();
              },
              icon: const Icon(
                Icons.menu,
                size: 38,
                color: Colors.black,
              )),
        ),
        ],
      ),
      body:  HomeBody(),
    );
  }
}
