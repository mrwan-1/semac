// ignore_for_file: deprecated_member_use

import 'package:auto_localized/auto_localized.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:she_mec/config.dart';
import 'package:she_mec/routes/auto_localized.al.dart';
import 'package:she_mec/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  // loader config
  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.black
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle;
    
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(ui.window),
      child: Builder(builder: (context) {
        return AutoLocalizedApp(
        
          child: GetMaterialApp(
            
            supportedLocales: AutoLocalizedData.supportedLocales,
            localizationsDelegates: AutoLocalizedData.localizationsDelegates,
            locale: const Locale('ar'),
            fallbackLocale: const Locale('ar'),
            home: const SplashScreen(),
            title: 'SHEMAC',
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            
            theme:ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme:
            const IconThemeData().copyWith(size: 20, color: Colors.white),
        centerTitle: true,
      ),
      colorScheme: const ColorScheme.light().copyWith(
        
        primary: Kbackdrung,
        secondary: Colors.black,
      ),
      primaryColor: Kbackdrung,
      buttonTheme: ButtonThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: Kbackdrung,
        ),
      ),
      textTheme: const TextTheme(
        // headline4: TextStyle(fontFamily: "Almarai"),
        // headline5: TextStyle(fontFamily: "Almarai"),
        headline6: TextStyle( fontSize: 19),
      )),
          ),
        );
      }),
    );
  }
}
