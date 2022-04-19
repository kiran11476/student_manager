import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_manager/db/functions/functions.dart';
import 'package:student_manager/screens/home_screen/home_screen_render.dart';

import '../../common_fuctions.dart';
import '../../db/model/model.dart';

class EditScreen extends StatelessWidget {
  final index;
  const EditScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: EditScreenRender(index: index),
      ),
    );
  }
}

final nameEditController = TextEditingController();
final ageEditController = TextEditingController();
final collegeEditController = TextEditingController();
final phoneEditController = TextEditingController();

class EditScreenRender extends StatefulWidget {
  final index;
  const EditScreenRender({Key? key, required this.index}) : super(key: key);

  @override
  State<EditScreenRender> createState() => _EditScreenRenderState(index: index);
}

class _EditScreenRenderState extends State<EditScreenRender> {
  final index;
  _EditScreenRenderState({required this.index});
  var imageEditData;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 380,
        child: Column(children: [
          gap(Height: 30, Width: 0),
          imageEditData == null
              ? CircleAvatar(
                  radius: 70,
                )
              : CircleAvatar(
                  radius: 70,
                  backgroundImage: FileImage(File(imageEditData)),
                ),
          gap(Height: 20, Width: 0),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                pickImage();
              },
              child: Text("Add Profile"),
            ),
          ),
          textField(
            labelText: "Name",
            valueController: nameEditController,
            type: TextInputType.name,
          ),
          textField(
            labelText: "Age",
            valueController: ageEditController,
            type: TextInputType.number,
          ),
          textField(
            labelText: "College",
            valueController: collegeEditController,
            type: TextInputType.name,
          ),
          textField(
            labelText: "Phone",
            valueController: phoneEditController,
            type: TextInputType.number,
          ),
          gap(Height: 30, Width: 0),
          studentAddButton(index),
        ]),
      ),
    );
  }

  Widget studentAddButton(index) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () async {
                  final studentDB =
                      await Hive.openBox<StudentModel>('student_db');

                  final _name = nameEditController.text.trim();
                  final _age = ageEditController.text.trim();
                  final _college = collegeEditController.text.trim();
                  final _phone = phoneEditController.text.trim();
                  final _image = imageEditData;

                  if (_name.isEmpty ||
                      _age.isEmpty ||
                      _college.isEmpty ||
                      _phone.isEmpty ||
                      _image == null) {
                    return;
                  }

                  final _student = StudentModel(
                    name: _name,
                    age: _age,
                    school: _college,
                    phone: _phone,
                    image: _image,
                    id: index,
                  );

                  await studentDB.putAt(index, _student);

                  getAllStudents();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Updated Successfully")));
                },
                child: const Text("Update Student")))
      ],
    );
  }

  pickImage() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_image?.path == null) return;
    setState(() {
      this.imageEditData = _image?.path;
    });
  }
}
