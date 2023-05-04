// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:she_mec/auth/widgets/opt_number.dart';
import 'package:she_mec/config.dart';
import '../../bottom_Navigtion/bottom_Navigtion.dart';
import '../../core/widgets/primary_botton.dart';
import '../../home/widgets/smal_divider.dart';
import '../regestr/controller.dart';
import 'controller.dart';

class LoginSecondScreen extends GetView {
  LoginSecondScreen({
    Key? key,
    this.loginFromRegister,
  }) : super(key: key);
  final LoginController _loginController = Get.find();
  final RegisterController registerController = Get.put(RegisterController());
  final bool? loginFromRegister;
  @override
  Widget build(BuildContext context) {
    EasyLoading.dismiss();
    return Scaffold(
      appBar: AppBar(title: const Text('التحقق من رقم الهاتف')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                 
                  SizedBox(
                    child: Image.asset('assets/images/sheimage.png'),
                    width: 130,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'رسالة نصية سوف ترسل إلى هاتفك قم بإدخال الكود المرسل',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // TextFormField(
                  //   decoration: inputDecoration(
                  //     label: 'رمز التحقق',
                  //     prefixIcon: Icons.email,
                  //   ),
                  //   keyboardType: TextInputType.number,
                  //   onChanged: _loginController.changeVerfCode,
                  // ),
                  OptNumber(
                    onChanged: _loginController.changeVerfCode,
                  ),
                  const SmallDivider(),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                      text: 'تسجيل الدخول',
                      onPressed: () {
                        _loginController.onSubmit();
                        if (loginFromRegister != null) {
                                  
                          registerController.onSubmit();
                
                        } 
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                            return const MyStatefulWidget();
                          },), (route) => false);
                      })
                ]),
          ),
        ),
      ),
      backgroundColor: Ktitle,
    );
  }
}
