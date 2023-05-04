// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:she_mec/type/makeup/view_data.dart';
import '../../config.dart';

class Makup extends StatefulWidget {
  const Makup({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<Makup> createState() => _MakupState();
}

class _MakupState extends State<Makup> {
  CollectionReference makeup =
      FirebaseFirestore.instance.collection('mackup');
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
         Expanded(
          flex: 1,
          child: 
         Container(
          width: double.infinity,
          height: double.infinity,
         decoration: const BoxDecoration(
          image:DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/mekup/title2.jpg')) ,
           color: Colors.white,
           borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
         ),
         ),
         ),
         Expanded(
              flex: 2,
              child: RefreshIndicator(
                color: Kbackdrung,
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  return Future<void>.delayed(const Duration(seconds: 3));
                },
                child: VIEWDATAMakup()
              ))
        ],
      ),
    );
  }
}
