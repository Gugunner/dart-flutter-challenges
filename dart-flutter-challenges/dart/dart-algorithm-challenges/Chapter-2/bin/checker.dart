
///Problem 2-5
///Write a program that evaluates a 13 digit ISBN and compares the identification number
///with the check digit. Each value is a character and is evaluated one by one so there is
///no way of knowing how long it is before you need to start processing each digit. Also
///any character can be input so considerations must be taken for non digit characters.


int checkDigitIsbn(String isbn) {
  print("Problem 2-5-1");
  print('Get ascii code of each character');
  for (var element in isbn.runes) {
    print('Char is -> ${String.fromCharCode(element)}');
    print('Value is -> ${element-48}');
  }
  print("************************\n");
  return 1;
}

int checkDigitIsbn2(String isbn) {
  print("Problem 2-5-2");
  print('Check ascii code of each character to make sure is a number');
  for (var element in isbn.runes) {
    int value = element - 48;
    print('Char is -> ${String.fromCharCode(element)}');
    if (value > 9) {
      print('Char is not a digit');
      break;
    }
    print('Value is -> ${element-48}');
  }
  print("************************\n");
  return 1;
}

int checkDigitIsbn3(String isbn) {
  print("Problem 2-5-3");
  print('Multiply values by 1 or 3 starting from left most value to right most value');
  Runes runes = isbn.runes;
  for (var idx = 0; idx < runes.length; idx++) {
    int element = runes.elementAt(idx);
    int value = runes.elementAt(idx) - 48;
    print('Char is -> ${String.fromCharCode(element)}');
    if (value > 9) {
      print('Char is not a digit');
      break;
    }
    print('Value is -> $value');
    int multipliedValue = idx % 2 == 0 ? value * 1 : value * 3;
    print('Multiplied value -> $multipliedValue');
  }
  print("************************\n");
  return 1;
}

int checkDigitIsbn4(String isbn) {
  print("Problem 2-5-4");
  print('Check you get only 12 or 13 digits');
  Runes runes = isbn.runes;
  for (var idx = 0; idx < runes.length; idx++) {
    if (idx > 12) {
      print('ISBN is longer than 13 digits, can\'t compute');
      break;
    }
    int element = runes.elementAt(idx);
    int value = runes.elementAt(idx) - 48;
    print('Char is -> ${String.fromCharCode(element)}');
    if (value > 9) {
      print('Char is not a digit');
      break;
    }
    print('Value is -> $value');
    int multipliedValue = idx % 2 == 0 ? value * 1 : value * 3;
    print('Multiplied value -> $multipliedValue');
  }
  print("************************\n");
  return 1;
}

int checkDigitIsbn5(String isbn) {
  print("Problem 2-5-5");
  print('Get identification number');
  int identificationNumber = 0;
  Runes runes = isbn.runes;
  for (var idx = 0; idx < runes.length; idx++) {
    if (idx > 12) {
      print('ISBN is longer than 13 digits, can\'t compute');
      break;
    }
    int element = runes.elementAt(idx);
    int value = runes.elementAt(idx) - 48;
    print('Char is -> ${String.fromCharCode(element)}');
    if (value > 9) {
      print('Char is not a digit');
      break;
    }
    print('Value is -> $value');
    if (idx < 12) {
      int multipliedValue = idx % 2 == 0 ? value * 1 : value * 3;
      print('Multiplied value -> $multipliedValue');
      identificationNumber += multipliedValue;
    }
  }
  identificationNumber = identificationNumber % 10;
  print('Identification number -> $identificationNumber');
  print("************************\n");
  return identificationNumber;
}

int checkDigitIsbn6(String isbn) {
  print("Problem 2-5-6");
  print('Compare check digit with identification number');
  int checkDigit = -1;
  int identificationNumber = 0;
  Runes runes = isbn.runes;
  for (var idx = 0; idx < runes.length; idx++) {
    if (idx > 12) {
      print('ISBN is longer than 13 digits, can\'t compute');
      break;
    }
    int element = runes.elementAt(idx);
    int value = runes.elementAt(idx) - 48;
    print('Char is -> ${String.fromCharCode(element)}');
    if (value > 9) {
      print('Char is not a digit');
      break;
    }
    print('Value is -> $value');
    if (idx < 12) {
      int multipliedValue = idx % 2 == 0 ? value * 1 : value * 3;
      print('Multiplied value -> $multipliedValue');
      identificationNumber += multipliedValue;
    }
    if (idx == 12) {
      checkDigit = value;
    }
  }
  identificationNumber = 10 - (identificationNumber % 10);
  print('Identification number -> $identificationNumber');
  print('Check digit -> $checkDigit');
  if (checkDigit != identificationNumber) {
    print('ISBN is not valid');
  }
  print("************************\n");
  return identificationNumber;
}