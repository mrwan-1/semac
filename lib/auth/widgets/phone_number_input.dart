// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberInput extends StatelessWidget {
  PhoneNumberInput({
    Key? key,
    required this.onPhoneChanged,
    required this.errorMessage,
    this.removeErrorMessages,
  }) : super(key: key);

  final String initialCountry = 'YE';
  final PhoneNumber number = PhoneNumber(isoCode: 'YE');
  final Function(String?) onPhoneChanged;
  final Function()? removeErrorMessages;
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber num) {
        onPhoneChanged(num.phoneNumber);
      },
      onInputValidated: (bool value) {
        if (removeErrorMessages != null) {
          removeErrorMessages!();
        }
      },
      inputDecoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide()),
        errorStyle:const TextStyle(fontSize: 14),
        hintText: 'ادخل رقم الهاتف',
        errorText: errorMessage,
      ),
      locale: 'ar',
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      countries: const ['YE'],
      textStyle:const TextStyle(fontSize: 14),
      maxLength: 9,
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: number,
      formatInput: false,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputBorder: const OutlineInputBorder(borderSide: BorderSide()),
      onSaved: (PhoneNumber number) {
        print("onSaved method");
      },
    );
  }
}
