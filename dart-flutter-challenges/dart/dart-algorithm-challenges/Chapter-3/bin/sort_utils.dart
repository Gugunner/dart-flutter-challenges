import 'dart:mirrors';
import 'dart:math';

void main() {
  ///Problem 3-1
  List<Student> students = [
    Student(grade: 76, studentId: 'ABCD01'),
    Student(grade: 43, studentId: 'ABCD54'),
    Student(grade: 89, studentId: 'ABCD02'),
    Student(grade: 23, studentId: 'ABCD98'),
    Student(grade: 98, studentId: 'ABCD10'),
    Student(grade: 65, studentId: 'ABCD34'),
    Student(grade: 87, studentId: 'ABCD05'),
  ];
  sortByProperty(listOfClasses: students, property: 'grade');
  sortByProperty(listOfClasses: students, property: 'studentId');
  ///Problem 3-2
  List<Agent> agents = [
    Agent(),
    Agent(),
    Agent(),
    Agent(),
    Agent()
  ];
  print(agents);
  print(agents[highestMedian(matrix: agents.map((e) => e.monthlySales).toList())]);
}

///Problem 3-1
///Write a program that sorts a group of students by grade, and then buy student ID
class Student {
  Student({int this.grade = -1, String this.studentId = ''});
  int grade;
  String studentId;

  @override
  String toString() {
    return '\n'
        '{'
        '"grade": "$grade",'
        '"studentId": "$studentId"'
        '}';
  }
}

///Sorts an ascending list of classes based on a variable property
List<dynamic> sortByProperty({required List<dynamic> listOfClasses, required String property}) {
  print("Problem 3-1-7");
  final newListOfClasses = copyList(listOfClasses);
  InstanceMirror instanceMirror = reflect(newListOfClasses.first);
  ClassMirror classMirror = instanceMirror.type;
  final keys = getAllClassVariableKeys(classMirror);
  if (!keys.contains(property)) {
    print('Property is not in class -> $property');
    return listOfClasses;
  }
  final propertyType = instanceMirror.getField(Symbol(property)).reflectee.runtimeType;
  if ((propertyType is! int) && !(propertyType is! String)) {
    print('Property is not int nor String type to be compared -> $propertyType $property');
    return listOfClasses;
  }
  print('List of classes-> $listOfClasses');
  print('Property -> $property');
  newListOfClasses.sort((el1, el2) => compareByProperty(element1: el1, element2: el2, property: property));
  print('New list of classes -> $newListOfClasses');
  print('***********************\n');
  return newListOfClasses;
}


///Problem 3-2
///Write a program that finds the agent with the best monthly
///sales average and also finds the agent with the highest median sales.

class Agent {
  Agent ()
    :monthlySales = getRandomNumbers(elements: 12, maximum: 101);
  List<double> monthlySales;

  double get averageSales => (monthlySales.reduce((value, element) => value + element))/monthlySales.length;

  @override
  String toString() {
    return '\n  Agent monthly sales-> $monthlySales\n'
    ' Average sales -> ${averageSales.toStringAsFixed(2)} \n';
  }
}

List<int> medianValue1({required List<dynamic> list}) {
  print("Problem 3-2-1");
  print('check even or odd length of list');
  String check = list.length % 2 == 0 ? 'even' : 'odd';
  print(check);
  return <int>[1];
}

List<int> medianValue2({required List<dynamic> list}) {
  print("Problem 3-2-2");
  print('get middle values for even length');
  List<int> check = [];
  int listLength = list.length;
  print(list);
  if (listLength % 2 == 0) {
    check.add(list[listLength~/2 - 1]);
    check.add(list[listLength~/2]);
  }
  print(check);
  return <int>[1];
}

List<int> medianValue3({required List<dynamic> list}) {
  print("Problem 3-2-3");
  print('get middle values for even length sorted list');
  List<int> check = [];
  List<dynamic> newList = sortAnyComparableList(list: list);
  int listLength = newList.length;
  if (listLength % 2 == 0) {
    check.add(newList[listLength~/2 - 1]);
    check.add(newList[listLength~/2]);
  }
  print(check);
  return <int>[1];
}

List<int> medianValue4({required List<dynamic> list}) {
  print("Problem 3-2-4");
  print('get middle value for odd length');
  List<int> check = [];
  List<dynamic> newList = sortAnyComparableList(list: list);
  int listLength = newList.length;
  check.add(newList[listLength~/2]);
  if (listLength % 2 == 0) {
    check.add(newList[(listLength~/2 )- 1]);
  }
  print(check);
  return <int>[1];
}

double medianValue({required List<dynamic> list}) {
  // print("Problem 3-2-5");
  // print('average value for median for even length');
  List<dynamic> check = [];
  List<dynamic> newList = sortAnyComparableList(list: list);
  int listLength = newList.length;
  check.add(newList[listLength~/2]);
  if (listLength % 2 == 0) {
    check.add(newList[(listLength~/2 ) - 1]);
  }
  // print('Check -> $check');
  double medianValue = (check.reduce((value, element) => value + element))/check.length;
  // print('Median Value -> $medianValue');
  return medianValue;
}


List<double> getRandomNumbers({required int elements, required int maximum}) {
  List<double> numbers = [];
  for (var idx = 0; idx < elements; idx++) {
    double number = (Random().nextInt(maximum)).toDouble();
    numbers.add(number);
  }
  return numbers;
}

///Sorts an ascending comparable list
List<dynamic> sortAnyComparableList({required List<dynamic> list}) {
  final newList = copyList(list);
  final propertyType = newList.first.runtimeType;
  if ((propertyType is! int) && !(propertyType is! String)) {
    print('Property is not int nor String type to be compared -> $propertyType');
    return list;
  }
  newList.sort((el1, el2) => el1.compareTo(el2));
  return newList;
}

int highestMedian({required List<List<double>> matrix}) {
  print('Problem 3-2-6');
  print('obtain row idx of matrix with highest median');
  double highestMedian = -1.0;
  double currentMedian = 0.0;
  int rowIdx = -1;
  for (var idx = 0; idx < matrix.length; idx++) {
    List<double> row = matrix[idx];
    final newList =  sortAnyComparableList(list: row);
    currentMedian = medianValue(list: newList);
    if (currentMedian > highestMedian) {
      rowIdx = idx;
      highestMedian = currentMedian;
    }
  }
  print('highest median -> $highestMedian');
  print('***********************\n');
  return rowIdx;
}

///Copies one dimension dynamic lists
List<dynamic> copyList(List<dynamic> list) {
  return new List<dynamic>.from(list);
}

List<String> getAllClassVariableKeys(ClassMirror classMirror) {
  final keys = <String>[];
  classMirror.declarations.forEach((key, value) {
    if(value is VariableMirror) {
      keys.add(MirrorSystem.getName(key));
    }
  });
  return keys;
}

int compareByProperty({required dynamic element1, required dynamic element2, required String property }) {
  final valueOne = reflect(element1).getField(Symbol(property)).reflectee;
  final valueTwo = reflect(element2).getField(Symbol(property)).reflectee;
  return valueOne.compareTo(valueTwo);
}




///Old versions only for reference
// List<dynamic> sortByProperty1({required List<dynamic> list, required String property}) {
//   print("Problem 3-1-1");
//   print('copy list to new list');
//   final newList = copyList(list);
//   print('List -> $list');
//   print('New list -> $newList');
//   return newList;
// }
//
// List<dynamic> sortByProperty2({required List<dynamic> list, required String property}) {
//   print("Problem 3-1-2");
//   print('change order on one value');
//   final newList = copyList(list);
//   final tempVal = newList[1];
//   newList[1] = newList[0];
//   newList[0] = tempVal;
//   print('List -> $list');
//   print('New list -> $newList');
//   return newList;
// }
//
// List<dynamic> sortByProperty3({required List<dynamic> list, required String property}) {
//   print("Problem 3-1-3");
//   print('compare each value by property');
//   final newList = copyList(list);
//   print('Property -> $property');
//   for (var idx = 1; idx < newList.length; idx++) {
//     final valueOne = reflect(newList[idx - 1]).getField(Symbol(property)).reflectee;
//     final valueTwo = reflect(newList[idx]).getField(Symbol(property)).reflectee;
//     print('Value 1 -> $valueOne');
//     print('Value 2 -> $valueTwo');
//     print('Compared values -> ${valueOne.compareTo(valueTwo)}');
//   }
//   return newList;
// }
//
//
//
// List<dynamic> sortByProperty4({required List<dynamic> list, required String property}) {
//   print("Problem 3-1-4");
//   print('compare each value by property');
//   print('List -> $list');
//   final newList = copyList(list);
//   print('Property -> $property');
//   newList.sort((el1, el2) => compareByProperty(element1: el1, element2: el2, property: property));
//   print('New list -> $newList');
//   return newList;
// }
//
// List<dynamic> sortByProperty5({required List<dynamic> list, required String property}) {
//   print("Problem 3-1-5");
//   print('validate property is in class');
//   final newList = copyList(list);
//   InstanceMirror instanceMirror = reflect(newList.first);
//   ClassMirror classMirror = instanceMirror.type;
//   final keys = getAllClassVariableKeys(classMirror);
//   if (!keys.contains(property)) {
//     print('Property is not in class -> $property');
//     return list;
//   }
//   print('List -> $list');
//   print('Property -> $property');
//   newList.sort((el1, el2) => compareByProperty(element1: el1, element2: el2, property: property));
//   print('New list -> $newList');
//   return newList;
// }
//
// List<dynamic> sortByProperty6({required List<dynamic> list, required String property}) {
//   print("Problem 3-1-1");
//   print('validate property has a type that can be compared');
//   final newList = copyList(list);
//   InstanceMirror instanceMirror = reflect(newList.first);
//   ClassMirror classMirror = instanceMirror.type;
//   final keys = getAllClassVariableKeys(classMirror);
//   if (!keys.contains(property)) {
//     print('Property is not in class -> $property');
//     return list;
//   }
//   final propertyType = instanceMirror.getField(Symbol(property)).reflectee.runtimeType;
//   if (!(propertyType is int) &&  !(propertyType is String)) {
//     print('Property is not int nor String type to be compared -> $propertyType $property');
//     return list;
//   }
//   print('List -> $list');
//   print('Property -> $property');
//   newList.sort((el1, el2) => compareByProperty(element1: el1, element2: el2, property: property));
//   print('New list -> $newList');
//   return newList;
// }