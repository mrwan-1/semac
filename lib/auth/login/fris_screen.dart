// ignore_for_file: sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:she_mec/auth/login/second_screen.dart';
import 'package:she_mec/bottom_Navigtion/bottom_Navigtion.dart';
import 'package:she_mec/config.dart';
import '../../core/widgets/primary_botton.dart';
import '../../home/widgets/smal_divider.dart';
import '../../model/provider/firebase_provider.dart';
import '../widgets/phone_number_input.dart';
import 'controller.dart';

class FirstScreen extends GetView {
  final FirebaseAuth auth = FirebaseAuth.instance;

  FirstScreen({Key? key}) : super(key: key);
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) {
              return  const MyStatefulWidget();
            },), (route) => false);
          }, icon: const Icon(Icons.arrow_back_ios_new))
        ],
        title: const Text('تسجيل الدخول')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Image.asset('assets/images/sheimage.png'),
                    width: 130,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'لتسجيل الدخول يرجى ادخال رقم هاتفك للتحقق',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<LoginController>(
                    init: LoginController(),
                    initState: (_) {},
                    builder: (_) {
                      return Directionality(
                        textDirection: TextDirection.ltr,
                        child: PhoneNumberInput(
                          onPhoneChanged: _.changePhoneNumber,
                          errorMessage: null,
                        ),
                      );
                    },
                  ),
                  const SmallDivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  PrimaryButton(
                      text: 'تسجيل الدخول',
                      onPressed: () async {
                        // page loader
                       
                        EasyLoading.show(status: 'يرجى الأنتظار');

                        await Api.loginWithPhone(
                            phoneNumber: _loginController.phoneNumber,
                            handleFailed: _handleFailure,
                            onCodeSent: (verfID) {
                              _loginController.changeVerfID(verfID);
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                                return LoginSecondScreen();
                              },), (route) => false);
                              EasyLoading.dismiss();
                            });
                      }),
                ]),
          ),
        ),
      ),
      backgroundColor: Ktitle,
    );
  }

  _handleFailure() => Get.snackbar(
    
        'عملية غير ناجحة',
        'الرجاء إعادة المحاولة',
        margin: const EdgeInsets.only(top: 60),
        backgroundColor: Colors.red.shade400,
        titleText: const Text(
          'عملية غير ناجحة',
           style:TextStyle(color: Colors.white),
        ),
        messageText: const Text(
          'الرجاء إعادة المحاولة',
          style:TextStyle(color: Colors.white),
        ),
      );
}
