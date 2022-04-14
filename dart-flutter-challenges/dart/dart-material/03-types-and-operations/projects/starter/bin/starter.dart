// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:characters/characters.dart';

/// Copy and paste the following emojis as needed to complete this 
/// chapter's exercizes and challenges:
/// 
/// 🎯
/// 🇲🇳
/// 👨‍👩‍👧‍👦
/// 🇹🇩🇷🇴
/// 👍🏿
void main() {
  //Runtime variable type check
  print(10.0.runtimeType);
  print(6.0.toInt());
  num someNumber = 3;
  //Downcasting
  print((someNumber as int).isEven);
  const hourlyRate = 19.5;
  const hoursWorked = 10;
  //Upcasting
  final totalCost = (hourlyRate * hoursWorked).toInt();
  print(totalCost.runtimeType);
  //Unicode
  print("Hello!".codeUnits);

  //String Buffer
  final message = StringBuffer();
  message.write('Hello');
  message.write(' my name is ');
  message.write('Raul');
  final messageString = message.toString();
  print(messageString);

  //Interpolation
  const name = 'Raul';
  const introduction = 'Hello my name is $name';
  print(introduction);

  const oneThird = 1 / 3;
  const sentence = 'One third is $oneThird';
  print(sentence);
  final fixedSentence = 'One third is ${oneThird.toStringAsFixed(3)}.';
  print(fixedSentence);

  //Multiline
  const bigString = '''
  You can have a string
  that contains multiple
  lines
  by
  doing this.''';
  print(bigString);

  var oneline = 'This is only '
  'a single '
  'line '
  'at runtime.';
  print(oneline);

  oneline = 'This is only ' +
  'a single ' +
  'line ' +
  'at runtime.';
  print(oneline);

  //Unicode insert
  print('I \u2764 Dart\u0021');

  /// Challenge 1: Teacher's grading
  ///
  /// You're a teacher and in your class attendance is worth 20% of the grade,
  /// the homework is worth 30% and the exam is worth 50%. Your student got 90
  /// points for her attendance, 80 points for her homework and 94 points on
  /// her exam. Calculate her grade as an integer percentage rounded down.
  const att = 0.2;
  const hw = 0.3;
  const ex = 0.5;

  const stAtt = 90;
  const stHw = 80;
  const stEx = 94;

  const result = stAtt * att + stHw * hw + stEx * ex;
  print(result.toInt());

  /// Challenge 2: Same same, but different
  ///
  /// This string has two flags that look the same. But they aren't! One of
  /// them is the flag of Chad and the other is the flag of Romania.
  ///
  /// ```
  /// const twoCountries = '🇹🇩🇷🇴';
  /// ```
  ///
  /// Which is which?
  ///
  /// **Hint**: Romania's regional indicator sequence is `RO`, and `R` is
  /// `127479` in decimal. Chad, which is _Tishād_ in Arabic and _Tchad_ in
  /// French, has a regional indicator sequence of `TD`. Sequence letter `T`
  /// is `127481` in decimal.
  print('🇹🇩'.runes); //Chad
  print('🇷🇴'.runes); //Romania

  /// Challenge 3: How many?
  ///
  /// Given the following string:
  ///
  /// ```
  /// const vote = 'Thumbs up! 👍🏿';
  /// ```
  ///
  /// How many UTF-16 code units are there?
  /// How many Unicode code points are there?
  /// How many Unicode grapheme clusters are there?

  const vote = 'Thumbs up! 👍🏿';

  print((vote.codeUnits).length);
  print((vote.runes).length);
  print((vote.characters).length);

  /// Challenge 4: Find the error
  ///
  /// What is wrong with the following code?
  ///
  /// ```
  /// const name = 'Ray';
  /// name += ' Wenderlich';
  /// ```

  //name is an immutable variable

  /// Challenge 5: What type?
  ///
  /// What is the type of `value`?
  ///
  /// ```
  /// const value = 10 / 2;
  /// ```

  const value = 10 / 2;
  print(value.runtimeType); // double

  /// Challenge 6: In summary
  ///
  /// What is the value of the constant named `summary`?
  ///
  /// ```
  /// const number = 10;
  /// const multiplier = 5;
  /// final summary = '$number \u00D7 $multiplier = ${number * multiplier}';
  /// ```

  const number = 10;
  const multiplier = 5;
  final summary = '$number \u00D7 $multiplier = ${number * multiplier}';
  print(summary); //'10 x 5 = 50'

}
