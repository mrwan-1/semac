
// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:she_mec/config.dart';

import 'dive.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool? islogin;

login(){
          var user = FirebaseAuth.instance.currentUser;
          if (user == null) {
            islogin = false;
          }else{
            islogin = true;
          }
}
  var user = FirebaseAuth.instance.currentUser?.phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        backgroundColor: Colors.grey[300],
        child: ListView(
          children: [
             ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 40),
              title: const Text(
                'Admin SH',
                style: TextStyle(fontSize: 25),
              ),
              
              subtitle: Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Text(
                  ' $user', style: const TextStyle(fontSize: 15),),
              ),
              leading: const CircleAvatar(
                radius: 40,
                backgroundColor: Ktitle,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            Dive(
                title: 'الصفحة الرئيسية',
                ontap: () {
                  Navigator.pop(context);
                },
                icon: Icons.home,
                icon2: Icons.arrow_back_ios_new),
           
            ExpansionTile(
              title: const Text('حسابي',style: TextStyle(fontSize: 20),),
              
              children: [
                Dive(
                    title: 'حسابي',
                    icon: Icons.person,
                    icon2: Icons.arrow_back_ios_new),
                Dive(
                    title: 'طلباتي ',
                    icon: Icons.history,
                    icon2: Icons.arrow_back_ios_new),
                Dive(
                    title: 'تغيير الاعدادات الشخصيه ',
                    icon: Icons.settings,
                    icon2: Icons.arrow_back_ios_new),
              
              ],
            ),
            Dive(
              ontap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Favorit(),));
              },
                title: 'مفضلتي',
                icon: Icons.favorite_rounded,
                icon2: Icons.arrow_back_ios_new),
                 Dive(
              ontap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Tracking(),));
              },
                title: "تتبع الطلبية",
                icon: Icons.delivery_dining_sharp,
                icon2: Icons.arrow_back_ios_new),
                  Dive(
                    title: 'من نحن ',
                    icon: Icons.message,
                    icon2: Icons.arrow_back_ios_new),
                      Dive(
                    title: ' مركز الدعم ',
                    icon: Icons.phone,
                    icon2: Icons.arrow_back_ios_new),
          ],
        ),
      ),
    );
  }
}
