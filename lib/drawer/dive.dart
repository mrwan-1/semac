// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../config.dart';

class Dive extends StatelessWidget {
   Dive({super.key,required this.title,required this.icon,required this.icon2,this.ontap});
 IconData icon , icon2;
String title;
VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
              child: Card(
                elevation: 2,
                child: ListTile(
                  title: Text(title,style: const TextStyle(fontSize: 20),),
                  leading: Icon(
                    icon,
                    color: Kbackdrung,
                    size: 30,
                  ),
                  trailing: Icon(
                    icon2,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            );
  }
}