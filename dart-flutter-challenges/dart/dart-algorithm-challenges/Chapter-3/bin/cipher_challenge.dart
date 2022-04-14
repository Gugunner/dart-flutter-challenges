///Problem 3-4
///Write a program for creating a substitution cipher problem.
///In a substitution cipher problem, all messages are made of uppercase letters
///and punctuation. The original message is called the plaintext, and you create
///the ciphertext by substituting each letter with another letter.
///For this problem, hard-code a const array of 26 character elements for the cipher,
///and have your program read a plaintext message and output the equivalent ciphertext.
void main() {
  String ciphText = cipherText(text:
    'This is a test text so we can fully assess how'
    ' the complete cipher text challenge is working and not quitting.'
    ' With this in mind we are trying to use all possible letters and possible thing works.'
  );
  plainText(cipherText: ciphText);

}

String cipherText1({required String text}) {
  print('Problem 3-4-1');
  print('write a function that reads each character and shows ascii code');
  Runes runes = text.runes;
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    int asciiCode = runes.elementAt(idx) - 48;
    print('Char code -> $charCode');
    print('ASCII code -> $asciiCode');
  }
  print('***********************\n');
  return '';
}

String cipherText2({required String text}) {
  print('Problem 3-4-2');
  print('write a function that normalizes all letters so they start at 0 and finishes at 25 for a-z and A-Z');
  String capText = text.toUpperCase();
  Runes runes = capText.runes;
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    int asciiCode = runes.elementAt(idx) - 48;
    print('Char code -> $charCode');
    print('ASCII code -> $asciiCode');
    int normAsciiCode = asciiCode - 17;
    print('Normalized code -> $normAsciiCode');
  }
  print('***********************\n');
  return '';
}

List<String> cipherArr = ['K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','A','B','C','D','E','F','G','H','I','J'];

String cipherText3({required String text}) {
  print('Problem 3-4-3');
  print('write an array of 26 elements that starts at K reaches Z and finishes at A'
  'write a function that given and index returns from the cipher array a new element');
  String capText = text.toUpperCase();
  Runes runes = capText.runes;
  String newCipher = '';
  for (var idx = 0; idx < runes.length; idx++) {
    int asciiCode = runes.elementAt(idx) - 48;
    int normAsciiCode = asciiCode - 17;
    newCipher += cipherArr[normAsciiCode];
  }
  print('New cipher text -> $newCipher');
  print('***********************\n');
  return newCipher;
}

String cipherText({required String text}) {
  print('Problem 3-4-4');
  print('write a function that checks if char element is in ciphArr');
  String capText = text.toUpperCase();
  Runes runes = capText.runes;
  String newCipher = '';
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    if(cipherArr.contains(charCode)) {
      int asciiCode = runes.elementAt(idx) - 48;
      int normAsciiCode = asciiCode - 17;
      newCipher += cipherArr[normAsciiCode];
    } else {
      newCipher += charCode;
    }
  }
  print('New cipher text -> $newCipher');
  print('***********************\n');
  return newCipher;
}

List<String> abcArr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];

///Problem 3-5
///Write a program that given a ciphered text returns it to plain text

String plainText1({required String cipherText}) {
  print('Problem 3-5-1');
  print('write a program that puts in lowercase all text');
  String lowText = cipherText.toLowerCase();
  Runes runes = lowText.runes;
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    int asciiCode = runes.elementAt(idx) - 48;
    print('Char code -> $charCode');
    print('ASCII code -> $asciiCode');
  }
  print('***********************\n');
  return '';
}

List<String> punctArr = ['.', '!', '?', ';'];

String plainText2({required String cipherText}) {
  print('Problem 3-5-2');
  print('write a program that checks if a punctuation mark is given so the next letter is capitalized');
  String lowText = cipherText.toLowerCase();
  Runes runes = lowText.runes;
  bool isPunc = true;
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    int asciiCode = runes.elementAt(idx) - 48;
    if (isPunc) {
      print('Char code -> $charCode should be capitalized -> ${charCode.toUpperCase()}');
      isPunc = false;
    }
    if (punctArr.contains(charCode)) isPunc = true;
    print('Char code -> $charCode');
    print('ASCII code -> $asciiCode');
  }
  print('***********************\n');
  return '';
}

String plainText({required String cipherText}) {
  print('Problem 3-5-3');
  print('write a program that given and index returns from the abcArr a new element');
  String lowText = cipherText.toLowerCase();
  Runes runes = lowText.runes;
  bool isPunc = true;
  String newPlainText = '';
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    if(abcArr.contains(charCode)) {
      int cipherIndex = cipherArr.indexOf(charCode.toUpperCase());
      if (isPunc) {
        isPunc = false;
        newPlainText += abcArr[cipherIndex].toUpperCase();
      } else {
        newPlainText += abcArr[cipherIndex];
      }
    } else {
      newPlainText += charCode;
    }
    if (punctArr.contains(charCode)) isPunc = true;
  }
  print('New plain text -> $newPlainText');
  print('***********************\n');
  return '';
}

//TODO check if cap letter and add a special token to check it