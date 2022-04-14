///Problem 2-9
///Write a program that reads a line of text, counting the number of words,
///identifying the length of the longest word, the greatest number of vowels
///in a word, counting vowel repetition per unique word, counting letter repetition per word
///identifying shortest word

void main() {
  // textAnalyzer1(textLine: 'AEIOUaeiouÁÉÍÓÚáéíóú');
  // textAnalyzer1(textLine: 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ');
  // textAnalyzer1(textLine: 'abcedefghijklmnñopqrstuvwxyz');
  // textAnalyzer1(textLine: 'ÁÉÍÓÚ');
  // textAnalyzer1(textLine: 'áéíóú');
  // textAnalyzer2(textLine: 'My name is Raul');
  // textAnalyzer3(textLine: 'My name is Raul');
  // textAnalyzer3(textLine: 'My name is Raul, and I want to create an amazing company that has a great team work!! \n '
  //     'Also I believe that one must create and nurture a culture inspired by companies such as The Toyota Way.');
  // print(textAnalyzer4(textLine: 'My name is Raul, and want to create an amazing company that has great team work!! \n '
  //     'Also believe that one must create and nurture culture inspired by companies such as The Toyota Way.'));
  // print(textAnalyzer5(textLine: 'My name is Raul, and want to create an amazing company that has great team work!! \n '
  //     'Also believe that one must create and nurture culture inspired by companies such as The Toyota Way.'));
  print(textAnalyzer(textLine: 'My name is Raul, and want to create an amazing company that has great team work!! \n '
      'Also believe that one must create and nurture culture inspired by companies such as The Toyota Way.'));
}

List<int> textToAscii({required String text}) {
  final asciiCodes = <int>[];
  Runes runes = text.runes;
  for (var idx = 0; idx < runes.length; idx++) {
    String charCode = String.fromCharCode(runes.elementAt(idx));
    int asciiCode = runes.elementAt(idx) - 48;
    print('Char code -> $charCode');
    print('ASCII code -> $asciiCode');
    asciiCodes.add(asciiCode);
  }
  return asciiCodes;
}

bool checkAsciiLetter({required int asciiCode}) {
  //Check A-Z and Ñ characters
  if (asciiCode >= 17 && asciiCode <= 42 || asciiCode == 161) return true;
  //Check a-z and ñ characters
  if (asciiCode >= 49 && asciiCode <= 74 || asciiCode == 193) return true;
  //Check ÁÉÍÓÚ and áéíóú characters
  switch (asciiCode) {
    case 145:
    case 153:
    case 157:
    case 163:
    case 170:
    case 177:
    case 185:
    case 189:
    case 195:
    case 202:
      return true;
  }
  return false;
}

bool checkAsciiVowel({required int asciiCode}) {
  switch (asciiCode) {
    case 17: //A
    case 21: //E
    case 25: //I
    case 31: //O
    case 37: //U
    case 49: //a
    case 53: //e
    case 57: //i
    case 63: //o
    case 69: //u
    case 145: //Á
    case 153: //É
    case 157: //Í
    case 163: //Ó
    case 170: //Ú
    case 177: //á
    case 185: //é
    case 189: //í
    case 195: //ó
    case 202: //ú
      return true;
  }
  return false;
}

String concatWord({required String oldString, required String newString }) => '$oldString$newString';

Map<String, Object> textAnalyzer1({required textLine}) {
  print("Problem 2-9-1");
  print('read characters as ascii values');
  List<int> asciiCodes = textToAscii(text: textLine);
  print("************************\n");
  return {
    'A': 'A'
  };
}

Map<String, Object> textAnalyzer2({required textLine}) {
  print("Problem 2-9-2");
  print('count words in text');
  List<int> asciiCodes = textToAscii(text: textLine);
  int wordCount = 0;
  for (var idx = 0; idx < asciiCodes.length; idx++) {
    if(idx > 0 && asciiCodes.elementAt(idx) == -16 || idx > 0 && asciiCodes.elementAt(idx) == -38 || idx == (asciiCodes.length - 1)) {
      wordCount++;
    }
  }
  print('Word count -> $wordCount');
  print("************************\n");
  return {
    'word count': wordCount
  };
}

Map<String, Object> textAnalyzer3({required textLine}) {
  print("Problem 2-9-3");
  print('finding longest word');
  List<int> asciiCodes = textToAscii(text: textLine);
  int wordCount = 0;
  final longestWords = <String>['',''];
  for (var idx = 0; idx < asciiCodes.length; idx++) {
    if (checkAsciiLetter(asciiCode: asciiCodes.elementAt(idx))) {
      longestWords[1] = '${longestWords[1]}${textLine[idx]}';
    }
    if(idx > 0 && asciiCodes.elementAt(idx) == -16 || idx == (asciiCodes.length - 1)) {
      wordCount++;
      if (longestWords[1].length > longestWords[0].length) {
        longestWords[0] = longestWords[1];
      }
      longestWords[1] = '';
    }
  }
  print('Word count -> $wordCount');
  print('Longest word -> ${longestWords[0]}');
  print('Longest word count -> ${longestWords[0].length}');
  print("************************\n");
  return {
    'word count': wordCount,
    'longest word': longestWords[0],
    'longest word count': longestWords[0].length
  };
}

Map<String, Object> textAnalyzer4({required textLine}) {
  print("Problem 2-9-4");
  print('finding shortest word');
  List<int> asciiCodes = textToAscii(text: textLine);
  int wordCount = 0;
  final longestWords = <String>['',''];
  final shortestWords = <String>['',''];
  for (var idx = 0; idx < asciiCodes.length; idx++) {
    if (checkAsciiLetter(asciiCode: asciiCodes.elementAt(idx))) {
      longestWords[1] = '${longestWords[1]}${textLine[idx]}';
      shortestWords[1] = '${shortestWords[1]}${textLine[idx]}';
    }
    if(idx > 0 && asciiCodes.elementAt(idx) == -16 || idx == (asciiCodes.length - 1)) {
      wordCount++;
      if (longestWords[1].length > longestWords[0].length) {
        longestWords[0] = longestWords[1];
      }
      if (shortestWords[0] == '' || (shortestWords[1].length < shortestWords[0].length && shortestWords[1].length > 0)) {
        shortestWords[0] = shortestWords[1];
        print('Shortest Word -> ${shortestWords[0]}');
      }
       longestWords[1] = '';
       shortestWords[1] = '';
    }
  }
  print("************************\n");
  return {
    'word count': wordCount,
    'longest word': longestWords[0],
    'longest word count': longestWords[0].length,
    'shortest word': shortestWords[0],
    'shortest word count': shortestWords[0].length
  };
}

Map<String, Object> textAnalyzer5({required textLine}) {
  print("Problem 2-9-5");
  print('find word with more vowels');
  List<int> asciiCodes = textToAscii(text: textLine);
  int wordCount = 0;
  final longestWords = <String>['',''];
  final shortestWords = <String>['',''];
  final mostVowelsWords = <String>['','','',''];
  for (var idx = 0; idx < asciiCodes.length; idx++) {
    if (checkAsciiLetter(asciiCode: asciiCodes.elementAt(idx))) {
      longestWords[1] = concatWord(oldString: longestWords[1], newString: textLine[idx]);
      shortestWords[1] = concatWord(oldString: shortestWords[1], newString: textLine[idx]);
      mostVowelsWords[1] = concatWord(oldString: mostVowelsWords[1], newString: textLine[idx]);
    }
    if (checkAsciiVowel(asciiCode: asciiCodes.elementAt(idx))) {
      mostVowelsWords[3] = concatWord(oldString: mostVowelsWords[3], newString: textLine[idx]);
    }
    if(idx > 0 && asciiCodes.elementAt(idx) == -16 || idx == (asciiCodes.length - 1)) {
      wordCount++;
      if (longestWords[1].length > longestWords[0].length) {
        longestWords[0] = longestWords[1];
      }
      if (shortestWords[0] == '' || (shortestWords[1].length < shortestWords[0].length && shortestWords[1].length > 0)) {
        shortestWords[0] = shortestWords[1];
        print('Shortest Word -> ${shortestWords[0]}');
      }
      if (mostVowelsWords[3].length > mostVowelsWords[2].length) {
          mostVowelsWords[0] = mostVowelsWords[1];
          mostVowelsWords[2] = mostVowelsWords[3];
      }
      longestWords[1] = '';
      shortestWords[1] = '';
      mostVowelsWords[1] = '';
      mostVowelsWords[3] = '';
    }
  }
  print("************************\n");
  return {
    'word count': wordCount,
    'longest word': longestWords[0],
    'longest word count': longestWords[0].length,
    'shortest word': shortestWords[0],
    'shortest word count': shortestWords[0].length,
    'word with most vowels': mostVowelsWords[0],
    'vowels count': mostVowelsWords[2].length
  };
}

Map<String, Object> textAnalyzer({required textLine}) {
  print("Problem 2-9-6");
  print('find letter repetition per unique word');
  List<int> asciiCodes = textToAscii(text: textLine);
  int wordCount = 0;
  final longestWords = <String>['',''];
  final shortestWords = <String>['',''];
  final mostVowelsWords = <String>['','','',''];
  var word = '';
  Map<String, Map<String,int>> uniqueWords = {
    'TEMPORAL_KEY': {

    }
  };
  for (var idx = 0; idx < asciiCodes.length; idx++) {
    if (checkAsciiLetter(asciiCode: asciiCodes.elementAt(idx))) {
      longestWords[1] = concatWord(oldString: longestWords[1], newString: textLine[idx]);
      shortestWords[1] = concatWord(oldString: shortestWords[1], newString: textLine[idx]);
      mostVowelsWords[1] = concatWord(oldString: mostVowelsWords[1], newString: textLine[idx]);
      word = concatWord(oldString: word, newString: textLine[idx]);
      if (uniqueWords['TEMPORAL_KEY']!.containsKey(textLine[idx])) {
        uniqueWords['TEMPORAL_KEY']![textLine[idx]] = (uniqueWords['TEMPORAL_KEY']![textLine[idx]])! + 1;
      } else {
        uniqueWords['TEMPORAL_KEY']![textLine[idx]] = 1;
      }
    }
    if (checkAsciiVowel(asciiCode: asciiCodes.elementAt(idx))) {
      mostVowelsWords[3] = concatWord(oldString: mostVowelsWords[3], newString: textLine[idx]);
    }
    if(idx > 0 && asciiCodes.elementAt(idx) == -16 || idx == (asciiCodes.length - 1)) {
      wordCount++;
      if (longestWords[1].length > longestWords[0].length) {
        longestWords[0] = longestWords[1];
      }
      if (shortestWords[0] == '' || (shortestWords[1].length < shortestWords[0].length && shortestWords[1].length > 0)) {
        shortestWords[0] = shortestWords[1];
        print('Shortest Word -> ${shortestWords[0]}');
      }
      if (mostVowelsWords[3].length > mostVowelsWords[2].length) {
        mostVowelsWords[0] = mostVowelsWords[1];
        mostVowelsWords[2] = mostVowelsWords[3];
      }

      uniqueWords[word] = uniqueWords['TEMPORAL_KEY']!;
      uniqueWords['TEMPORAL_KEY'] = {};

      longestWords[1] = '';
      shortestWords[1] = '';
      mostVowelsWords[1] = '';
      mostVowelsWords[3] = '';
      word = '';
    }
  }
  uniqueWords.remove('TEMPORAL_KEY');
  print("************************\n");
  return {
    'word count': wordCount,
    'longest word': longestWords[0],
    'longest word count': longestWords[0].length,
    'shortest word': shortestWords[0],
    'shortest word count': shortestWords[0].length,
    'word with most vowels': mostVowelsWords[0],
    'vowels count': mostVowelsWords[2].length,
    'unique words': uniqueWords
  };
}
