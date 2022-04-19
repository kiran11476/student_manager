import 'package:hive_flutter/hive_flutter.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String school;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final image;

  StudentModel(
      {required this.id,
      required this.name,
      required this.age,
      required this.school,
      required this.phone,
      required this.image});
}
