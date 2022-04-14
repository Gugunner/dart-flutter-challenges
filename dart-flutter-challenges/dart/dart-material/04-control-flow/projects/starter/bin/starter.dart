// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.
import 'dart:math';
/// Here is the emoji you'll use in the lesson today for your cut-and-paste
/// convenience:
/// 
/// ❤
///

enum Weather {
  sunny,
  snowy,
  cloudy,
  rainy,
}

void main() {

  const weatherToday = Weather.cloudy;
  switch (weatherToday) {
    case Weather.sunny:
      print('Put on sunscreen.');
      break;
    case Weather.snowy:
      print('Get your skis.');
      break;
    case Weather.cloudy:
    case Weather.rainy:
      print('Bring an umbrella.');
      break;
  }

  final random = Random();
  while (random.nextInt(6) + 1 != 6) {
    print('Not a six!');
  }
  print('Finally, you got a six!');

  const myString = 'I ❤ Dart';
  for (var codePoint in myString.runes) {
    print('${String.fromCharCode(codePoint)} - $codePoint');
  }

  const myNumbers = [1,2,3,4];
  myNumbers.forEach((el) => print(el));
  myNumbers.forEach((el) {
    print(el);
  });

  /// Challenge 4: Fibonacci
  ///
  /// Calculate the nth Fibonacci number. Remember that Fibonacci numbers
  /// start its sequence with 1 and 1, and then subsequent numbers in the
  /// sequence are equal to the previous two values added together. You can
  /// get a refresher here: https://en.wikipedia.org/wiki/Fibonacci_number
  var fibValues = [0,1];
  for (var idx=0; idx < 10; idx++ ) {
    final fibValOne = fibValues[0];
    final fibValTwo = fibValues[1];
    print('The fibonacci sequence in cycle $idx is $fibValOne $fibValTwo');
    fibValues[0] = fibValues[0] + fibValues[1];
    fibValues[1] = fibValues[0] + fibValues[1];
  }

  print(1 % 2);
  print(7%2);
  print(7/2);
  // print(1000000%100000);
}