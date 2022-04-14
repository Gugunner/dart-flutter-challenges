///Problem 2-8
///Write a program that converts from any number base-16 or less to any other number base
///The number is unlimited but assume it can be stored on a Dart int type value.
enum Base { binary, tertiary, quaternary, quinary, senary, septenary, octal, nonary, decimal, undecimal, duodecimal, tridecimal, tetradecimal, pentadecimal, hexadecimal}
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
    String charCode = String.fromCharCode(rune);
    print('Char code -> $charCode');
    int value = rune - 48;
    if (value > 9) {
      valueToConvert = -1;
      print('Not a valid decimal digit -> $charCode');
      print('Value -> $value');
      break;
    }
    valueToConvert = valueToConvert*10 + value;
  }
  return valueToConvert;
}

Map<Base, int> baseValue = {
  Base.binary: 2,
  Base.tertiary: 3,
  Base.quaternary: 4,
  Base.quinary: 5,
  Base.senary: 6,
  Base.septenary: 7,
  Base.octal: 8,
  Base.nonary: 9,
  Base.decimal: 10,
  Base.undecimal: 11,
  Base.duodecimal: 12,
  Base.tridecimal: 13,
  Base.tetradecimal: 14,
  Base.pentadecimal: 15,
  Base.hexadecimal: 16
};
///Test must return 359277
void main() {
  // convertBaseToDecimal1(stringValue: '1010111101101101101', inBase: Base.binary);
  // convertBaseToDecimal1(stringValue: '200020211120', inBase: Base.tertiary);
  // convertBaseToDecimal1(stringValue: '1113231231', inBase: Base.quaternary);
  // convertBaseToDecimal1(stringValue: '42444102', inBase: Base.quinary);
  // convertBaseToDecimal1(stringValue: '11411153', inBase: Base.senary);
  // convertBaseToDecimal1(stringValue: '3024312', inBase: Base.septenary);
  // convertBaseToDecimal1(stringValue: '1275555', inBase: Base.octal);
  // convertBaseToDecimal1(stringValue: '606746', inBase: Base.nonary);
  // convertBaseToDecimal1(stringValue: '359277', inBase: Base.decimal);
  // convertBaseToDecimal2(stringValue: '225A26', inBase: Base.undecimal);
  // convertBaseToDecimal2(stringValue: '153AB9', inBase: Base.duodecimal);
  // convertBaseToDecimal2(stringValue: 'C76B9', inBase: Base.tridecimal);
  // convertBaseToDecimal2(stringValue: '94D09', inBase: Base.tetradecimal);
  // convertBaseToDecimal2(stringValue: '716BC', inBase: Base.pentadecimal);
  // convertBaseToDecimal2(stringValue: '57B6D', inBase: Base.hexadecimal);
  // convertBaseToDecimal3(stringValue: '57B6R', inBase: Base.hexadecimal);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.binary);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.tertiary);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.quaternary);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.quinary);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.senary);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.septenary);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.octal);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.nonary);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.decimal);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.undecimal);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.duodecimal);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.tridecimal);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.tetradecimal);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.pentadecimal);
  // convertDecimalToBase4(decimalValue: 359277, outBase: Base.hexadecimal);
  convertBaseToBase(stringValue: '1010111101101101101', inBase: Base.binary, outBase: Base.octal);
}

int convertBaseToDecimal1({required stringValue, required Base inBase}) {
  print("Problem 2-8-1");
  print('multiply by the base number up to base 10');
  int valueToConvert = 0;
  int numberBase = baseValue[inBase]!;
  Runes runes = stringValue.runes;
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    print('Char code -> $charCode');
    int value = runes.elementAt(idx) - 48;
    print('Value -> $value');
    valueToConvert = idx == 0 ? value : numberBase*valueToConvert +value;
  }
  print(inBase.toString());
  print('Value to convert -> $valueToConvert');
  print("************************\n");
  return valueToConvert;
}

int convertBaseToDecimal2({required stringValue, required Base inBase}) {
  print("Problem 2-8-2");
  print('multiply by the base number up to base 16');
  int valueToConvert = 0;
  int numberBase = baseValue[inBase]!;
  Runes runes = stringValue.runes;
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    print('Char code -> $charCode');
    int value = runes.elementAt(idx) - 48;
    if (value > 9) {
      value =  decDigitFromHexDigit(charCode);
    }
    print('Value -> $value');
    valueToConvert = idx == 0 ? value : numberBase*valueToConvert +value;
  }
  print(inBase.toString());
  print('Value to convert -> $valueToConvert');
  print("************************\n");
  return valueToConvert;
}
///*****************************************FINISHED**********************************************************///

int convertBaseToDecimal({required String stringValue, required Base inBase}) {
  print("Problem 2-8-3");
  print('check for any non valid digit character');
  int valueToConvert = 0;
  int numberBase = baseValue[inBase]!;
  Runes runes = stringValue.runes;
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    print('Char code -> $charCode');
    int value = runes.elementAt(idx) - 48;
    if (value > 9) {
      value =  decDigitFromHexDigit(charCode);
    }
    if (value < 0) {
      print('Not a valid digit character -> $charCode');
      valueToConvert = -1;
      break;
    }
    print('Value -> $value');
    valueToConvert = idx == 0 ? value : numberBase*valueToConvert +value;
  }
  print(inBase.toString());
  print('Value to convert -> $valueToConvert');
  print("************************\n");
  return valueToConvert;
}

String convertDecimalToBase({required int decimalValue, required Base outBase}) {
  print("Problem 2-8-4");
  print('convert decimal value up to base hexadecimal');
  String convertedValue = '';
  int valueToConvert = decimalValue;
  int remnantValue = 0;
  int numberBase = baseValue[outBase]!;
  do {
    remnantValue = valueToConvert % numberBase;
    valueToConvert = valueToConvert ~/ numberBase;
    convertedValue = '${remnantValue > 9 ? hexDigitFromDecDigit(remnantValue) : remnantValue}$convertedValue';
  } while (valueToConvert > 0);
  print(outBase.toString());
  print('Converted value -> $convertedValue');
  print("************************\n");
  return convertedValue;
}

String convertBaseToBase({required String stringValue, required Base inBase, required Base outBase}) {
  int decimalValue = convertBaseToDecimal(stringValue: stringValue, inBase: inBase);
  return convertDecimalToBase(decimalValue: decimalValue, outBase: outBase);
}