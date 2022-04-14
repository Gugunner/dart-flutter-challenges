enum Grade { A, B, C, D, F }

///Inheritance Concrete Classes
class Person {
  Person(this.givenName, this.surname);
  String givenName;
  String surname;
  String get fullName => '$givenName $surname';

  @override
  String toString() => fullName;
}

class Student extends Person{
  Student(String givenName, String surname)
    : super(givenName, surname);
  var grades = <Grade>[];

  @override
  String get fullName => '$surname, $givenName';
}

class SchoolBandMember extends Student {
  SchoolBandMember(String givenName, String surname)
    : super(givenName, surname);
  static const minimumPracticeTime = 2;
}

class StudentAthlete extends Student {
  StudentAthlete(String givenName, String surname)
    : super(givenName, surname);
  bool get isEligible => grades.every((grade) => grade != Grade.F);
}

///Mini-excercises 1
class Fruit {
  Fruit(this.color);
  String color;
  void describeColor() {
    print('The fruit color is $color');
  }
}

class Melon extends Fruit {
  Melon(String color)
    : super(color);
}

class Watermelon extends Melon {
  Watermelon(String color)
    : super(color);

  @override
  void describeColor() {
    print('The watermelon color is $color');
  }
}

class Cantaloupe extends Melon {
  Cantaloupe(String color)
    : super(color);
}

///Abstract Classes
abstract class Animal {
  bool isAlive = true;
  void eat();
  void move();

  @override
  String toString() {
    return 'I\'m a $runtimeType';
  }
}

class Platypus extends Animal with EggLayer implements Comparable {
  Platypus({this.weight});
  final weight;

  @override
  void eat() {
    print('Munch munch');
  }

  @override
  void move() {
    print('GLide glide');
  }

  @override
  int compareTo(other) {
    // TODO: implement compareTo
    if (weight > other.weight) {
      return 1;
    } else if (weight < other.weight) {
      return -1;
    }
    return 0;
    throw UnimplementedError();
  }
}

///Using Abstract Classes as Interfaces
abstract class DataRepository {
  //Use factory constructor to use for business logic
  //Since FakeWebServer is a subclass of DataRepository,
  //the factory constructor is allowed to return it
  factory DataRepository() => FakeWebServer();
  double? fetchTemperature(String city);
}
//Implementing the interface
class FakeWebServer implements DataRepository {
  @override
  double? fetchTemperature(String city) => 42.0;
}

///Extend VS Implement
class AnotherClass {
  int myFIeld = 42;
  void myMethod() => print(myFIeld);
}
//Extends
class SomeClass extends AnotherClass {}
//Implements (Must use own version of methods when using implements)
class SomeClass2 implements AnotherClass {
  @override
  int myFIeld = 0;

  @override
  void myMethod() => print('Hello');
}

///Mini-excercise 2
abstract class Bottle {
  factory Bottle() => SodaBottle();
  void open();
}

class SodaBottle implements Bottle {

  @override
  void open() {
    print('Fizz fizz');
  }
}

///Mixins
abstract class Bird {
  void fly();
  void layEggs();
}

class Robin extends Animal with EggLayer, Flyer {
  @override
  void eat() {
    print('Munch munch');
  }

  @override
  void move() {
    print('GLide glide');
  }
}

mixin EggLayer {
  void layEggs() {
    print('Plop plop');
  }
}

mixin Flyer {
  void fly() {
    print('Swoosh swoosh');
  }
}

///Mini-excercise 3
class Calculator with Adder {}

mixin Adder {
  void sum(int number1, int number2) => print(number1 + number2);
}

///Extensions
extension on String {
  //getter method

  String get encoded =>_code(1);
  String get decoded => _code(-1);


  String _code(int step) {
    final output = StringBuffer();
    for (final codePoint in runes) {
      output.writeCharCode(codePoint + step);
    }
    return output.toString();
  }
}

enum ProgrammingLanguage { dart, swift, javaScript }

extension on ProgrammingLanguage {
  bool get isStronglyTyped {
    switch (this) {
      case ProgrammingLanguage.dart:
      case ProgrammingLanguage.swift:
        return true;
      case ProgrammingLanguage.javaScript:
        return false;
      default:
        throw Exception('Unknown Progamming Language $this');
    }
  }
}

/// Challenge 1: Heavy monotremes
///
/// Dart has a class named `Comparable` which is used by the the `sort` method
/// of `List` to sort its elements. Add a `weight` field to the `Platypus`
/// class you made in this lesson. Then make `Platypus` implement `Comparable`
/// so that when you have a list of `Platypus` objects, calling sort on the
/// list will sort them by weight.


/// Challenge 2: Fake notes
///
/// Design an interface to sit between the business logic of your
/// note-taking app and a SQL database. After that, implement a fake
/// database class that will return mock data.

abstract class DataRepositoryNoteApp {
  factory DataRepositoryNoteApp() => SqlDataBase();
  String mockData();
}

class SqlDataBase implements DataRepositoryNoteApp {
  @override
  String mockData() {
    // TODO: implement mockData
    return 'Mock Data';
    throw UnimplementedError();
  }

}

/// Challenge 3: Time to code
///
/// Dart has a `Duration` class for expressing lengths of time. Make an
/// extension on `int` so that you can express a duration like so:
///
/// ```
/// final timeRemaining = 3.minutes;
/// ```
extension on int {
  Duration get minutes => Duration(minutes: this);
}

void main() {
  ///Inheritance Concrete Classes
  final jon = Person('Jon', 'Snow');
  final jane = Student('Jane', 'Snow');
  print(jon.fullName);
  print(jane.fullName);
  final historyGrade = Grade.B;
  jane.grades.add(historyGrade);
  final jessie = SchoolBandMember('Jessie', 'Jones');
  final marty = StudentAthlete('Marty', 'McFly');
  ///All student instances can be in a list
  final students = [jane, jessie, marty];
  print(jessie is Object);
  print(jessie is Person);
  print(jessie is Student);
  print(jessie is SchoolBandMember);
  print(jessie is StudentAthlete);

  ///Abstract Classes
  Animal platypus = Platypus(weight: 10);
  print(platypus.isAlive);
  platypus.eat();
  platypus.move();
  // platypus.layEggs();
  print(platypus);

  ///Using Interface
  final repository = DataRepository(); //Returns the factory constructor FakeWebServer but the code has no idea
  final temperature = repository.fetchTemperature('Manila');

  ///Extend VS Implement
  final someClass = SomeClass();
  print(someClass.myFIeld);
  someClass.myMethod();
  final someClass2 = SomeClass2();
  print(someClass2.myFIeld);
  someClass2.myMethod();

  ///Mini-excercise 2
  final sodaBottle = Bottle();
  sodaBottle.open();

  ///Mixin
  final platypus2 = Platypus(weight: 30);
  final robin = Robin();
  platypus2.layEggs();
  robin.layEggs();

  ///Mini-excercise 3
  final calculator = Calculator();
  calculator.sum(4, 3);

  ///Extensions
  String encode(String input) {
    final output = StringBuffer();
    for (final codePoint in input.runes) {
      output.writeCharCode(codePoint + 1);
    }
    return output.toString();
  }

  // final original = 'abc';
  // final secret = 'abc'.encoded;
  // print(secret);
  final original = 'I like extensions';
  final secret = original.encoded;
  final revealed = secret.decoded;
  print(secret);
  print(revealed);

  final language = ProgrammingLanguage.dart;
  print(language.isStronglyTyped);

  final willi = Platypus(weight: 1.0);
  final billi = Platypus(weight: 2.4);
  final nilli = Platypus(weight: 2.1);
  final jilli = Platypus(weight: 0.4);
  final silli = Platypus(weight: 1.7);

  final platypi = [willi, billi, nilli, jilli, silli];

  platypi.forEach((platypus) => print(platypus.weight));
  print('---');

  platypi.sort();
  platypi.forEach((platypus) => print(platypus.weight));

  final noteApp = DataRepositoryNoteApp();
  print(noteApp.mockData());

  final timeRemaining = 3.minutes;
  print(timeRemaining);

  print('Uif!tfdsfu!up!mfbsojoh!Ebsu!xfmm!jt!up!dg"ewtkqwu\"cpf"lwuv"vt{"vjkpiu0"Vlqfh#|rx*uh#uhdglqj#wklv/#wkdw#reylrxvo|#ghvfulehv#|rx1#Kssh\$nsf%'.decoded);

}