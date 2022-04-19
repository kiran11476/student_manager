import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_manager/db/model/model.dart';

ValueNotifier<List<StudentModel>> studentList = ValueNotifier([]);

addStudents(StudentModel value) async {
  final student_db = await Hive.openBox<StudentModel>("student_db");

  await student_db.add(value);
  studentList.value.add(value);

  getAllStudents();
}

Future<void> getAllStudents() async {
  final student_db = await Hive.openBox<StudentModel>("student_db");

  studentList.value.clear();
  studentList.value.addAll(student_db.values);
  studentList.notifyListeners();
}

deletTile(StudentModel data) async {
  final student_db = await Hive.openBox<StudentModel>("student_db");

  final keys = student_db.keys;

  final key = keys.elementAt(data.id);

  student_db.deleteAt(data.id);
  
  getAllStudents();  
}
