// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:she_mec/config.dart';
import 'package:splashscreen/splashscreen.dart';

import '../bottom_Navigtion/bottom_Navigtion.dart';


class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: const MyStatefulWidget(),
      title: const Text('SHEMAC',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 50.0,
        color: Colors.white
      ),),
      image: Image.asset('assets/images/sheimage.png',height: 440,fit: BoxFit.cover,),
      backgroundColor: Kbackdrung,
      styleTextUnderTheLoader: const TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("SHEMAC"),
      loaderColor: Colors.white);
  }
}