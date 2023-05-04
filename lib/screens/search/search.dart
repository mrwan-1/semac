// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Searche extends StatefulWidget {
  const Searche({super.key});

  @override
  State<Searche> createState() => _SearcheState();
}

class _SearcheState extends State<Searche> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('البحث'),
      ),
    );
  }
}