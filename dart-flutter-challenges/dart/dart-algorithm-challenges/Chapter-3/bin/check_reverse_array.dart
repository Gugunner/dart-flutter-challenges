import 'sort_utils.dart';

///Problem 3-3
///Write a program that given an array and the number of elements in that array
///determines whether the data in the array is sorted in just one pass.

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

void main() {
  // print(sortAnyComparableList(list: [1,3,8,5,7,8]));
  // print(1.compareTo(2));
  // print(2.compareTo(1));
  // print(1.compareTo(1));
  // checkSortedList1(list: [1,3,8,5,7,8]);
  // checkSortedList2(list: [1,3,8,5,7,8]);
  // print(checkSortedList3(list: [1,3,8,5,7,8]));
  checkSortedList4(list: [1,3,4,9,0,8,5,7,8]);
  checkSortedList4(list: [0,1,2,3,4,5,6,7,8,9]);
  checkSortedList4(list: [0,"1",2,3,4,5,6,7,8,9]);
}


bool checkSortedList1({required List<dynamic> list}) {
  print('Problem 3-3-1');
  print('create a function that reads an int array');
  for (var el in list) {
    print(el);
  }
  return true;
}

bool checkSortedList2({required List<dynamic> list}) {
  print('Problem 3-3-2');
  print('create a function that checks if a < b');
  for (var idx = 1; idx < list.length; idx++) {
    dynamic a = list[idx-1];
    dynamic b = list[idx];
    print('a -> $a');
    print('b -> $b');
    if (a.compareTo(b) > 0) {
      print('a > b -> $a > $b');
    }
  }
  return true;
}

bool checkSortedList3({required List<dynamic> list}) {
  print('Problem 3-3-3');
  print('create a function that alerts when an element is not sorted');
  bool isSorted = true;
  for (var idx = 1; idx < list.length; idx++) {
    dynamic a = list[idx-1];
    dynamic b = list[idx];
    print('a -> $a');
    print('b -> $b');
    if (a.compareTo(b) > 0) {
      print('a > b -> $a > $b');
      isSorted = false;
      print('The list is not sorted!');
      break;
    }
  }
  return isSorted;
}

bool checkSortedList4({required List<dynamic> list}) {
  print('Problem 3-3-4');
  print('create a function that checks list elements are ints or doubles');
  bool isSorted = true;
  for (var idx = 1; idx < list.length; idx++) {
    dynamic a = list[idx-1];
    dynamic b = list[idx];
    if((a.runtimeType != int && a.runtimeType != double) || (b.runtimeType != int && b.runtimeType != double)) {
      print('a or b -> $a or $b is not an int or a double');
      break;
    }
    print('a -> $a');
    print('b -> $b');
    if (a.compareTo(b) > 0) {
      print('a > b -> $a > $b') ;
      isSorted = false;
      print('The list is not sorted!');
      break;
    }
  }
  return isSorted;
}