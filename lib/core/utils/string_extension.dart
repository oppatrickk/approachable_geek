extension StringExtension on String? {
  static String formatUSPhone(String value) {
    if (value.isEmpty) return '';

    String digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.startsWith('1') && digitsOnly.length > 10) {
      digitsOnly = digitsOnly.substring(1);
    } else if (digitsOnly.startsWith('1') && digitsOnly.length == 11) {
      digitsOnly = digitsOnly.substring(1);
    }

    if (digitsOnly.length > 10) {
      digitsOnly = digitsOnly.substring(0, 10);
    }

    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 0) buffer.write('(');
      buffer.write(digitsOnly[i]);

      if (i == 2) buffer.write(') ');
      if (i == 5) buffer.write('-');
    }

    return buffer.toString();
  }
}
