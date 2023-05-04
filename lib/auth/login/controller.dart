import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/provider/firebase_provider.dart';


class LoginController extends GetxController {
 late String phoneNumber ;
  String? verfID;
  String? verfCode;

  changePhoneNumber(String? value) => phoneNumber = value!;
  changeVerfID(String? value) => verfID = value;
  changeVerfCode(String? value) => verfCode = value;

  onSubmit() {
    Api.verifyOTP(
        verificationID: verfID!,
        smsCode: verfCode!,
        onSucess: () {
          Get.snackbar("عملية ناجحة", "تم تسجيل الدخول بنجاح",
              margin: const EdgeInsets.only(top: 60),
              backgroundColor: Colors.green,
              titleText: const Text(
                'عملية ناجحة',
                style: TextStyle(color: Colors.white),
              ),
              messageText: const Text(
                'تم تسجيل الدخول بنجاح',
                style:TextStyle(color: Colors.white),
              ));
        },
        onError: () {
          Get.snackbar("عملية غير ناجحة", "الكود المدخل غير صحيح",
              margin: const EdgeInsets.only(top: 60),
              backgroundColor: Colors.red.shade400,
              titleText: const Text(
                'عملية غير ناجحة',
                style:TextStyle(color: Colors.white),
              ),
              messageText: const Text(
                'الكود المدخل غير صحيح',
                style:TextStyle(color: Colors.white),
              ));
        });
  }
}
