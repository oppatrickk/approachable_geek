import 'package:flutter/services.dart';

class USPhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    final String oldDigits = oldValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (newValue.text.length < oldValue.text.length) {
      if (digitsOnly.length == oldDigits.length && digitsOnly.isNotEmpty) {
        digitsOnly = digitsOnly.substring(0, digitsOnly.length - 1);
      }
    }

    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 0) buffer.write('(');
      buffer.write(digitsOnly[i]);

      if (i == 2) buffer.write(') ');
      if (i == 5) buffer.write('-');
    }

    final string = buffer.toString();

    return TextEditingValue(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(text: newValue.text.toLowerCase());
  }
}
