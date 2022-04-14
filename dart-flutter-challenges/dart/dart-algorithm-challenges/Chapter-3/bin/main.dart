
import 'sort_utils.dart';

void main() {
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
}
