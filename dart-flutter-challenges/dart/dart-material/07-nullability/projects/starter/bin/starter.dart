import 'dart:math';

///Class with nullable types
class User {
  String? name;
  int? id;
}

///Class with late example
class LateUser {
  LateUser(this.name) {
    _secretNumber = _calculateSecret();
  }

  final String name;
  // late final int _secretNumber = _calculateSecret();
  late final int _secretNumber;
  int _calculateSecret() {
    return name.length + 42;
  }

}

///No promotion for non-local variables
class TextWidget {
  String? text;
  bool assertionIsLong() {
    if (text == null) {
      return false;
    }
    //Use assertion to guarantee it can be used
    return text!.length > 100;
  }
  bool shadowingIsLong() {
    final text = this.text;
    if (text == null) {
      return false;
    }
    return text.length > 100;
  }
}

///Example of lazy loading with late to avoid heavy calculations
class HeavyClass {
  late String? value = doHeavyCalculations();
  String? doHeavyCalculations() {
    //More heavy calculations
    return 'Result of heavy calculations';
  }
}

///Challenge 2: Naming customs
class Name {
  Name({required this.givenName, this.surname, this.surnameIsFirst = false});
  String givenName;
  String? surname;
  bool surnameIsFirst;

  @override
  String toString() {
    if (surname == null) {
      return givenName;
    }
    return surnameIsFirst ?  '$surname $givenName' : '$givenName $surname';
  }
}

void main() {

  print(isPositive(3));
  print(isPositive(-1));
  print(isNullPositive(null));
  
  String? profession;
  profession = 'basketball player';
  const iLove = 'Dart';

  String? name;
  name = 'Ray';
  print(name.length);

  ///If-null operator(??)
  String? message;
  final text = message ?? 'Error';
  print(text);

  ///Null-aware assignment operator(??=)
  double? fontSize;
  // fontSize = fontSize ?? 20.0;
  fontSize ??= 20.0;

  ///Null-aware access operator(?.)/Null-aware method invocation operator
  int? age;
  print(age?.isNegative);
  print(age?.toDouble());
  print(age?.toDouble().isNegative);

  ///Null assertion operator(!)/Bang operator
  // bool flowerIsBeautiful = isBeautiful('flower') as bool;
  var flowerIsBeautiful = isBeautiful('flower')!;
  ///Better use a Null-aware operator
  var secureFlowerIsBeautiful = isBeautiful('flower') ?? true;

  ///Null-aware cascade operator(?..)
  // User user = User()
  //   ..name = 'Ray'
  //   ..id = 42;
  User? user;
  user
    ?..name='Ray'
    ..id = 42;
  String? lengthString = user?.name?.length.toString();

  ///Null-aware index operator(?[])
  List<int>? myList = [1,2,3]; //list can be null but not the values inside
  myList = null;
  int? myItem = myList?[2];
  print(myItem);

  /// Challenge 1: Random nothings
  ///
  /// Write a function that randomly returns `42` or `null`. Assign
  /// the return value of the function to an variable named `result` that
  /// will never be `null`. Give `result` a default of `0` if the function
  /// returns `null`.

  int? randomReturn() {
    final random = Random().nextBool();
    return random ? 42 : null;
  }

  int result = randomReturn() ?? 0;
  print(result);

  /// Challenge 2: Naming customs
  ///
  /// People around the world have different customs for giving names to
  /// children. It would be difficult to create a data class to accurately
  /// represent them all, but try it like this:
  ///
  /// - Create a class called `Name` with `givenName` and `surname` properties.
  /// - Some people write the surname last and some write it first. Add a
  ///   Boolean property called `surnameIsFirst` to keep track of this.
  /// - Not everyone in the world has a surname.
  /// - Add a `toString` method that prints the full name.
  final ray = Name(givenName: 'Ray', surname: 'Wenderlich');
  final liMing = Name(surname: 'Li', givenName: 'Ming', surnameIsFirst: true);
  final baatar = Name(givenName: 'Baatar');

  print(ray);
  print(liMing);
  print(baatar);

}

bool isPositive(int anInteger) {
  return !anInteger.isNegative;
}

///Example to check for null types
bool isNullPositive(int? anInteger) {
  return anInteger == null ? false : !anInteger.isNegative;
}

///Function returning nullable types
bool? isBeautiful(String? item) {
  if (item=='flower') {
    return true;
  } else if (item == 'garbage') {
    return false;
  }
  return null;
}