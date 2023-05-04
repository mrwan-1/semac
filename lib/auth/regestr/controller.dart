// ignore_for_file: avoid_print

import 'package:get/get.dart';

import 'package:nanoid/async.dart';

import '../../model/provider/firebase_provider.dart';
import '../../model/user_model.dart';

// firebase_storage.FirebaseStorage storage =
//     firebase_storage.FirebaseStorage.instance;

class RegisterController extends GetxController {
  // screen 1 state
  String ownerName = '';
  String? ownerNameErrorMessage;
  String serviceName = '';
  String? serviceNameErrorMessage;
  String? ownerPhoneNumber;
  String? ownerPhoneErrorMessage;
  String? servicePhoneNumber;
  String? servicePhoneErrorMessage;
  // UploadImageData? imgData;
  Map<String, String?> formErrors = {};
  Map<String, String?> formErrors2 = {};
  changeOwnerName(String value) {
    ownerName = value;
  }

  removeOwnerNameErrorMessage() {
    formErrors['ownerNameErrorMessage'] = null;
    update();
  }

  removeServiceNameErrorMessage() {
    formErrors['serviceNameErrorMessage'] = null;
    update();
  }

  removeOwnerPhoneErrorMessage() {
    formErrors['ownerPhoneErrorMessage'] = null;
    update();
  }

  removeServicePhoneErrorMessage() {
    formErrors['servicePhoneErrorMessage'] = null;
    update();
  }

  changeServiceName(String value) {
    serviceName = value;
    serviceNameErrorMessage = null;
    update();
  }

  changeOwnerPhoneNumber(String? value) {
    ownerPhoneNumber = value;
  }

  changeServicePhoneNumber(String? value) => servicePhoneNumber = value;

  // uploadImageData(UploadImageData? data) {
  //   imgData = UploadImageData();
  //   imgData!.fileName = data?.fileName;
  //   imgData!.imageFile = data?.imageFile;
  // }

  // Future<String> download(ref) async => await storage.ref(ref).getDownloadURL();
  // screen 2 state
  String? bankAccountType;
  String bankAccountNumber = '';
  String? region;
  String address = '';
  String? imageErrorMessage;
  String? imageSucessMessage;

  changeBankAccountType(String value) {
    bankAccountType = value;
    update();
  }

  changeBankAccountNumber(String value) => bankAccountNumber = value;
  changeRegion(String value) {
    region = value;
    update();
  }

  changeImageErrorMessage(String? value) {
    formErrors['imageErrorMessage'] = value;
    update();
  }

  changeImageSucessMessage(String? value) {
    imageSucessMessage = value;
    update();
  }

  changeAddress(String value) => address = value;

  validateFirstScreenInputs() {
    if (ownerName.isEmpty) {
      formErrors['ownerNameErrorMessage'] =
          "الرجاء ادخال نص فقط من غير ارقام او رموز";
      update();
    }
    if (serviceName.isEmpty) {
      formErrors['serviceNameErrorMessage'] =
          "الرجاء ادخال نص فقط من غير ارقام او رموز";
      update();
    }
    if (ownerPhoneNumber == null) {
      formErrors['ownerPhoneErrorMessage'] = "الرجاء ادخال رقم صحيح";
      update();
    }
    if (ownerPhoneNumber != null) {
      if (ownerPhoneNumber!.length < 13) {
        formErrors['ownerPhoneErrorMessage'] = "الرجاء ادخال رقم صحيح";
        update();
      }
    }
    if (servicePhoneNumber == null) {
      formErrors['servicePhoneErrorMessage'] = "الرجاء ادخال رقم صحيح";
      update();
    }
    if (servicePhoneNumber != null) {
      if (servicePhoneNumber!.length < 13) {
        formErrors['servicePhoneErrorMessage'] = "الرجاء ادخال رقم صحيح";
        update();
      }
    }
    // if (imgData == null) {
    //   formErrors['imageErrorMessage'] = "الرجاء اختيار صورة";
    //   update();
    // }
  }

  validateSecondScreenInputs() {
    if (!GetUtils.isNumericOnly(bankAccountNumber)) {
      formErrors2['bankAccountNumberErrorMessage'] =
          "الرجاء ادخال البيانات المطلوبة";
      update();
    }
    if (address.isEmpty) {
      formErrors2['address'] = "الرجاء ادخال البيانات المطلوبة";
      update();
    }
  }

  removeAddressErrorMessages() {
    formErrors2['address'] = null;
    update();
  }

  removeBankAccountNumErrMsg() {
    formErrors2['bankAccountNumberErrorMessage'] = null;
    update();
  }

  formValid(Map<String, String?> formErrorsMap) {
    bool isValid = true;
    formErrorsMap.forEach((key, value) {
      if (value != null) {
        isValid = false;
        return;
      }
    });

    return isValid;
  }

  onSubmit() async {
    print("executed in onSubmit fn");

    // await storage.ref(imgData?.fileName).putFile(
    //       imgData?.imageFile,
    //     );
    print(
        "$ownerName, $serviceName, $ownerPhoneNumber, $servicePhoneNumber, $bankAccountType, $bankAccountNumber, $region, $address");
    String id = await nanoid();
    UserModel user = UserModel(
      id: id,
      ownerName: ownerName,
      // imageFilename: imgData!.fileName,
      serviceName: serviceName,
      ownerPhoneNumber: ownerPhoneNumber!,
      servicePhoneNumber: servicePhoneNumber!,
      bankAccountType: bankAccountType,
      bankAccountNumber: bankAccountNumber,
      region: region,
      address: address,
    );
    // // print(user.toJson());

    await Api.saveUserToDB(user);

    print("operation successed");
  }
}
