import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../user_model.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class Api {
  final users = firestore.collection('users');
  final FirebaseAuth auth = FirebaseAuth.instance;

  static loginWithPhone({
    required String phoneNumber,
    required Function(String) onCodeSent,
    required Function() handleFailed,
  }) async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          // ignore: avoid_print
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        EasyLoading.dismiss();
        handleFailed();
      },
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  static verifyOTP(
      {required String verificationID,
      required String smsCode,
      required Function onSucess,
      required Function onError}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: smsCode);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      onSucess();
    } catch (e) {
      onError();
    }
  }

  static saveUserToDB(UserModel user) async => await firestore
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set(user.toJson());
}
