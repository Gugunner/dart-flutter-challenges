
import 'dart:ffi';
///Import scripts
import 'user.dart';

///Mini-excercise 1

class Password {
  final String value;

  const Password({String value = 'change_me'})
  :value = value;

  bool isValid() {
  return value.length > 8;
  }

  @override
  String toString() {
  return 'value: $value';
  }
}

/// Challenge 1: Bert and Ernie
///
/// Create a `Student` class with final `firstName` and `lastName`
/// `String` properties and a variable `grade` as an `int` property.
/// Add a constructor to the class that initializes all the properties.
/// Add a method to the class that nicely formats a `Student` for printing.
/// Use the class to create students `bert` and `ernie` with grades of 95 and
/// 85, respectively.

class Student {
  Student ({this.firstName = 'Anonymous', this.lastName = 'Unknown', this.grade = 0});
  final String firstName;
  final String lastName;
  int grade;
  @override
  String toString() {
    return '''
    '{
        "firstName": $firstName, 
        "lastName": $lastName, 
        "grade": $grade
    }'
    ''';
  }
}

/// Challenge 2: Spheres
///
/// Create a `Sphere` class with a `const` constructor that takes a positive
/// length `radius` as a named parameter. Add getters for the the volume and
/// surface area but none for the radius. Don't use the `dart:math` package
/// but store your own version of `pi` as a `static` constant. Use your class
/// to find the volume and surface area of a sphere with a radius of 12.

class Sphere {
  const Sphere ({int radius = 12})
    :assert(radius > 0),
    _radius = radius;

  final int _radius;

  static const double pi = 3.141516;

  double get volume {
    var tempVolumeRadius = _radius;
    for (var i = 1; i <3; i++) {
      tempVolumeRadius *= _radius;
    }
    return ((3/4)*Sphere.pi) * tempVolumeRadius;
  }
  double get surface => 4*Sphere.pi*_radius*_radius;
}


void main() {

  const user = User(id: 42, name: 'Raul');
  print(user.toString());
  print(user.toJson());
  /// Dart cascade operator
  const user2 = User(id: 42, name: 'Jess');
  // .._name = 'Jess'
  // .._id = 42;
  print(user2.toString());
  print(user2.toJson());
  ///Using named constructor
  const anonymousUser = User.anonymous();
  print(anonymousUser.toString());
  print(anonymousUser.toJson());
  ///Throws an assert initialization id list error
  // const jb = User(id: -1, name: 'JB Lorenzo');

  final userRaul = User.raul();
  print(userRaul.toString());
  print(userRaul.toJson());

  final map = {'id': 10, 'name': 'Manda'};
  final manda = User.fromJson(map);
  print(manda.toString());
  print(manda.toJson());
  print(User.fromJsonStatic(map));

  ///Challenge 1: Bert and Ernie
  final bert = Student(firstName: 'Bert', lastName: "Berty", grade: 95);
  final ernie = Student(firstName: 'Ernie', lastName: 'Ernieo', grade: 85);
  print(bert.toString());

  ///Challenge 2: Spheres
  const sphere = Sphere();
  print(sphere.volume);
  print(sphere.surface);
}

