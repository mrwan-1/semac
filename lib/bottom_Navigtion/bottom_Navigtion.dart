// ignore_for_file: file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:she_mec/config.dart';
import '../home/home_scrren.dart';
import '../screens/FovertsScren/foverts_screen.dart';
import '../screens/search/search.dart';
import '../screens/shopingCart/card.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectScrenIndex = 0;
  bool iSlogin = true;
 

  final List<Map<String, dynamic>> _screen = [
    {
      'Screen': HomeScrren(),
      'Title': 'المثلث الذهبي',
    },
    {
      'Screen': const FovertsScreen(),
      'Title': 'المفضله',
    },
    {
      'Screen':  CartProducts(),
      'Title': 'السله',
    },
    {
      'Screen':  const Searche() ,
      'Title': 'البحث',
    },
  ];

  void _selectScren(int index) {
    setState(() {
      _selectScrenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          animationDuration: const Duration(
            milliseconds: 300,
          ),
          onTap: _selectScren,
          backgroundColor: Ktitle,
          buttonBackgroundColor: Kbackdrung,
          items: const [
            Icon(Icons.home),
            Icon(Icons.favorite_border),
            Icon(Icons.shopping_cart_outlined),
            Icon(Icons.search),
          ]),
      body: _screen[_selectScrenIndex]['Screen'],
    );
  }
}
