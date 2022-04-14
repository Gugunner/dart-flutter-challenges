///Problem 2-7
///Write a program that given an input  decimal, binary or hexadecimal
///and output in any of the three.
///The number is unlimited but assume it can be stored on a Dart int type value.
enum Base {binary, hexadecimal, decimal}

void mainBaseNumber() {
  convertNumberBase(stringValue: 'ABCDEF', inBase: Base.hexadecimal, outBase: Base.decimal);
  convertNumberBase2(stringValue: 'E7A9', inBase: Base.hexadecimal, outBase: Base.decimal);
  convertNumberBase3(stringValue: 'E7A9', inBase: Base.hexadecimal, outBase: Base.decimal);
  convertNumberBase3(stringValue: 'E7R9', inBase: Base.hexadecimal, outBase: Base.decimal);
  convertNumberBase3(stringValue: 'AFA89', inBase: Base.hexadecimal, outBase: Base.decimal);
  convertNumberBase4(stringValue: 'AFA89', inBase: Base.hexadecimal, outBase: Base.decimal);
  convertNumberBase4(stringValue: 'AFR89', inBase: Base.hexadecimal, outBase: Base.decimal);
  convertNumberBase5(stringValue: '101111001', inBase: Base.binary, outBase: Base.decimal);
  convertNumberBase5(stringValue: '1011110012', inBase: Base.binary, outBase: Base.decimal);
  convertNumberBase6(stringValue: '00111001', inBase: Base.decimal, outBase: Base.binary);
  convertNumberBase6(stringValue: '7654523674523', inBase: Base.decimal, outBase: Base.binary);
  convertNumberBase6(stringValue: '0011R1001', inBase: Base.decimal, outBase: Base.binary);
  convertNumberBase7(stringValue: '1128', inBase: Base.decimal, outBase: Base.hexadecimal);
  convertNumberBase7(stringValue: '89457', inBase: Base.decimal, outBase: Base.hexadecimal);
  convertNumberBase7(stringValue: '7654523674523', inBase: Base.decimal, outBase: Base.hexadecimal);
  convertNumberBase8(stringValue: '1101111011000110101001010100001111110011011', inBase: Base.binary, outBase: Base.hexadecimal);
  convertNumberBase9(stringValue: '6F6352A1F9B', inBase: Base.hexadecimal, outBase: Base.binary);
}

//Map functions
Map baseFunctions = {
  'hexToDec': hexToDec,
  'decToHex': decToHex,
  'binToDec': binToDec,
  'decToBin': decToBin,
  'binToHex': binToHex,
  'hexToBin': hexToBin
};

///Return hexadecimal digit as decimal digit value 2-7-1
int decDigitFromHexDigit(String hexChar) {
  switch (hexChar) {
    case 'A':
      return 10;
    case 'B':
      return 11;
    case 'C':
      return 12;
    case 'D':
      return 13;
    case 'E':
      return 14;
    case 'F':
      return 15;
    default:
      return -1;
  }
}

String hexDigitFromDecDigit(int value) {
  switch (value) {
    case 10:
      return 'A';
    case 11:
      return 'B';
    case 12:
      return 'C';
    case 13:
      return 'D';
    case 14:
      return 'E';
    case 15:
      return 'F';
    default:
      return '';
  }
}

int decimalConverter({required Runes runes}) {
  int valueToConvert = 0;
  for (var rune in runes) {
    int value = rune - 48;
    if (value > 9) {
      valueToConvert = -1;
      print('Not a valid decimal digit -> ${String.fromCharCode(rune)}');
      break;
    }
    valueToConvert = valueToConvert*10 + value;
  }
  return valueToConvert;
}

//SRP hexadecimal to decimal
int hexToDec({required String stringValue, required Runes runes}) {
  int valueToConvert = 0;
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    int value = runes.elementAt(idx) - 48;
    if (value > 9) {
      value = decDigitFromHexDigit(charCode);
    }
    if (value < 0) {
      valueToConvert = -1;
      print('Not a valid hexadecimal digit -> $charCode');
      break;
    }
    valueToConvert = idx == 0 ? value : (valueToConvert * 16) + value;
  }
  return valueToConvert;
}
///6F6352A1F9B
///6F6352A1F9B
String decToHex({required String stringValue, required Runes runes}) {
  String convertedValue = '';
  int valueToConvert = decimalConverter(runes: runes);
  int remnantValue = 0;
  do {
    remnantValue = valueToConvert % 16;
    valueToConvert = valueToConvert ~/ 16;
    convertedValue = '${remnantValue > 9 ? hexDigitFromDecDigit(remnantValue) : remnantValue}$convertedValue';
  } while (valueToConvert > 0);
  return convertedValue;
}

int binToDec({required String stringValue, required Runes runes}) {
  int valueToConvert = 0;
  for (var idx = 0; idx < runes.length; idx++) {
    int value = runes.elementAt(idx) - 48;
    if (value < 0 || value > 1 ) {
      print('Not a valid binary digit ${String.fromCharCode(runes.elementAt(idx))}');
      valueToConvert = -1;
      break;
    }
    valueToConvert = 2*valueToConvert + (value == 1 ? 1 : 0);
  }
  return valueToConvert;
}

String decToBin({required String stringValue, required Runes runes}) {
  String convertedValue = '';
  int valueToConvert = decimalConverter(runes: runes);
  int remnantValue = 0;
  if(valueToConvert > -1) {
    do {
      remnantValue = valueToConvert % 2;
      valueToConvert = valueToConvert ~/ 2;
      convertedValue = '$remnantValue$convertedValue';
    } while(valueToConvert >= 1);
  }
  return valueToConvert < 0 ? '-1' : convertedValue;
}

String binToHex({required String stringValue, required Runes runes}) {
  String newStringValue = '${binToDec(stringValue: stringValue, runes: runes)}';
  Runes newRunes = newStringValue.runes;
  return decToHex(stringValue: newStringValue, runes: newRunes);
}

String hexToBin({required String stringValue, required Runes runes}) {
  String newStringValue = '${hexToDec(stringValue: stringValue, runes: runes)}';
  Runes newRunes = newStringValue.runes;
  return decToBin(stringValue: newStringValue, runes: newRunes);
}

void convertNumberBase({required String stringValue, required Base inBase, required Base outBase}) {
  print("Problem 2-7-1");
  print('Convert hexadecimal digits to decimal digits');
  Runes runes = stringValue.runes;
  int valueToConvert = 0;
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    int value = decDigitFromHexDigit(charCode);
    print('Char value is -> $charCode');
    print('Value is -> $value');
  }
  print("************************\n");
}

void convertNumberBase2({required String stringValue, required Base inBase, required Base outBase}) {
  print("Problem 2-7-2");
  print('Convert hexadecimal decimal value');
  Runes runes = stringValue.runes;
  int valueToConvert = 0;
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    int value = runes.elementAt(idx) - 48;
    if (value > 9) {
      value = decDigitFromHexDigit(charCode);
    }
    print('Char value is -> $charCode');
    valueToConvert = idx == 0 ? value : (valueToConvert * 16) + value;
    print('Value is -> $value');
    print('Value to convert -> $valueToConvert');
  }
  print('Value to convert -> $valueToConvert');
  print("************************\n");
}

void convertNumberBase3({required String stringValue, required Base inBase, required Base outBase}) {
  print("Problem 2-7-3");
  print('Check valid hexadecimal digit');
  Runes runes = stringValue.runes;
  int valueToConvert = 0;
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    int value = runes.elementAt(idx) - 48;
    if (value > 9) {
      value = decDigitFromHexDigit(charCode);
    }
    if (value < 0) {
      valueToConvert = -1;
      print('Not a valid hexadecimal digit');
      break;
    }
    print('Char value is -> $charCode');
    valueToConvert = idx == 0 ? value : (valueToConvert * 16) + value;
    print('Value is -> $value');
    print('Value to convert -> $valueToConvert');
  }
  print('Value to convert -> $valueToConvert');
  print("************************\n");
}




void convertNumberBase4({required String stringValue, required Base inBase, required Base outBase}) {
  print("Problem 2-7-4");
  print('Integrate hex to dec function');
  print('String value -> $stringValue');
  int valueToConvert = 0;
  Runes runes = stringValue.runes;
  String callFunction = 'hexToDec';
  if (inBase == Base.hexadecimal && outBase == Base.decimal) {
    callFunction = 'hexToDec';
  }
  valueToConvert = baseFunctions[callFunction](stringValue: stringValue, runes: runes);
  print('Value to convert -> $valueToConvert');
  print("************************\n");
}

void convertNumberBase5({required String stringValue, required Base inBase, required Base outBase}) {
  print("Problem 2-7-5");
  print('Integrate bin to dec function');
  print('String value -> $stringValue');
  String valueToConvert = '';
  Runes runes = stringValue.runes;
  String callFunction = 'hexToDec';
  if (inBase == Base.hexadecimal && outBase == Base.decimal) {
    callFunction = 'hexToDec';
  } else if (inBase == Base.binary && outBase == Base.decimal) {
    callFunction = 'binToDec';
  }
  valueToConvert = '${baseFunctions[callFunction](stringValue: stringValue, runes: runes)}';
  print('Value to convert -> $valueToConvert');
  print("************************\n");
}

void convertNumberBase6({required String stringValue, required Base inBase, required Base outBase}) {
  print("Problem 2-7-6");
  print('Integrate dec to bin function');
  print('Value to convert -> $stringValue');
  String convertedValue = '';
  Runes runes = stringValue.runes;
  String callFunction = 'hexToDec';
  if (inBase == Base.hexadecimal && outBase == Base.decimal) {
    callFunction = 'hexToDec';
  } else if (inBase == Base.binary && outBase == Base.decimal) {
    callFunction = 'binToDec';
  } else if (inBase == Base.decimal && outBase == Base.binary) {
    callFunction = 'decToBin';
  }
  convertedValue = '${baseFunctions[callFunction](stringValue: stringValue, runes: runes)}';
  print('Converted value -> $convertedValue');
  print("************************\n");
}

void convertNumberBase7({required String stringValue, required Base inBase, required Base outBase}) {
  print("Problem 2-7-7");
  print('Integrate dec to hex function');
  print('Value to convert -> $stringValue');
  String convertedValue = '';
  Runes runes = stringValue.runes;
  String callFunction = 'hexToDec';
  if (inBase == Base.hexadecimal && outBase == Base.decimal) {
    callFunction = 'hexToDec';
  } else if (inBase == Base.binary && outBase == Base.decimal) {
    callFunction = 'binToDec';
  } else if (inBase == Base.decimal && outBase == Base.binary) {
    callFunction = 'decToBin';
  } else if (inBase == Base.decimal && outBase == Base.hexadecimal) {
    callFunction = 'decToHex';
  }
  convertedValue = '${baseFunctions[callFunction](stringValue: stringValue, runes: runes)}';
  print('Converted value -> $convertedValue');
  print("************************\n");
}

void convertNumberBase8({required String stringValue, required Base inBase, required Base outBase}) {
  print("Problem 2-7-8");
  print('Integrate bin to hex function');
  print('Value to convert -> $stringValue');
  String convertedValue = '';
  Runes runes = stringValue.runes;
  String callFunction = 'hexToDec';
  if (inBase == Base.hexadecimal && outBase == Base.decimal) {
    callFunction = 'hexToDec';
  } else if (inBase == Base.binary && outBase == Base.decimal) {
    callFunction = 'binToDec';
  } else if (inBase == Base.decimal && outBase == Base.binary) {
    callFunction = 'decToBin';
  } else if (inBase == Base.decimal && outBase == Base.hexadecimal) {
    callFunction = 'decToHex';
  } else if (inBase == Base.binary && outBase == Base.hexadecimal) {
    callFunction = 'binToHex';
  }
  convertedValue = '${baseFunctions[callFunction](stringValue: stringValue, runes: runes)}';
  print('Converted value -> $convertedValue');
  print("************************\n");
}

void convertNumberBase9({required String stringValue, required Base inBase, required Base outBase}) {
  print("Problem 2-7-8");
  print('Integrate hex to bin function');
  print('Value to convert -> $stringValue');
  String convertedValue = '';
  Runes runes = stringValue.runes;
  String callFunction = 'hexToDec';
  if (inBase == Base.hexadecimal && outBase == Base.decimal) {
    callFunction = 'hexToDec';
  } else if (inBase == Base.binary && outBase == Base.decimal) {
    callFunction = 'binToDec';
  } else if (inBase == Base.decimal && outBase == Base.binary) {
    callFunction = 'decToBin';
  } else if (inBase == Base.decimal && outBase == Base.hexadecimal) {
    callFunction = 'decToHex';
  } else if (inBase == Base.binary && outBase == Base.hexadecimal) {
    callFunction = 'binToHex';
  } else if (inBase == Base.hexadecimal && outBase == Base.binary) {
    callFunction = 'hexToBin';
  }
  convertedValue = '${baseFunctions[callFunction](stringValue: stringValue, runes: runes)}';
  print('Converted value -> $convertedValue');
  print("************************\n");
}

