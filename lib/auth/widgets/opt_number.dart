// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:she_mec/config.dart';


class OptNumber extends StatelessWidget {
   OptNumber({super.key,required this.onChanged});
   void Function(String)? onChanged;
final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Kbackdrung),
    borderRadius: BorderRadius.circular(20),
  ),
);


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
     
        length: 6,
        
        onChanged:onChanged,
      defaultPinTheme: defaultPinTheme,
      // focusedPinTheme: focusedPinTheme,
      // submittedPinTheme: submittedPinTheme,
      validator: (s) {
      return s == null  ? 'error' : '';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    ),
    );
  }
}