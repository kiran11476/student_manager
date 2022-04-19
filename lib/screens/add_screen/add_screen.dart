import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_manager/common_fuctions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_manager/db/model/model.dart';

import '../../db/functions/functions.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

final nameController = TextEditingController();
final ageController = TextEditingController();
final collegeController = TextEditingController();
final phoneController = TextEditingController();

class _AddScreenState extends State<AddScreen> {
  var imageData;
  var key = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Add Student"),
        ),
        body: bodyRender(context),
      ),
    );
  }

  Widget bodyRender(BuildContext context) {
    return Center(
      child: Container(
        width: 380,
        child: Column(children: [
          gap(Height: 30, Width: 0),
          imageData == null
              ? CircleAvatar(
                  radius: 70,
                )
              : CircleAvatar(
                  radius: 70,
                  backgroundImage: FileImage(File(imageData)),
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
            valueController: nameController,
            type: TextInputType.name,
          ),
          textField(
            labelText: "Age",
            valueController: ageController,
            type: TextInputType.number,
          ),
          textField(
            labelText: "College",
            valueController: collegeController,
            type: TextInputType.name,
          ),
          textField(
            labelText: "Phone",
            valueController: phoneController,
            type: TextInputType.number,
          ),
          gap(Height: 30, Width: 0),
          studentAddButton(),
        ]),
      ),
    );
  }

  Widget studentAddButton() {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  final _name = nameController.text.trim();
                  final _age = ageController.text.trim();
                  final _college = collegeController.text.trim();
                  final _phone = phoneController.text.trim();
                  final _image = imageData;
                  final _id = key;

                  if (_name.isEmpty ||
                      _age.isEmpty ||
                      _college.isEmpty ||
                      _phone.isEmpty ||
                      _image == null) {
                    return;
                  }
                  if (studentList.value.isNotEmpty) {
                    if (studentList.value[studentList.value.length - 1].id >=
                        key) {
                      key = studentList.value[studentList.value.length - 1].id +
                          1;
                    }
                  }

                  final _student = StudentModel(
                    name: _name,
                    age: _age,
                    school: _college,
                    phone: _phone,
                    id: _id,
                    image: _image,
                  );

                  addStudents(_student);
                  getAllStudents();

                  key += 1;

                  // showInSnackBar(context) {
                  //   Scaffold.of(context)
                  //       .showSnackBar( SnackBar(content:  Text("Added")));
                  // }

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Added Successfully")));
                },
                child: const Text("Add Student")))
      ],
    );
  }

  pickImage() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_image?.path == null) return;
    setState(() {
      this.imageData = _image?.path;
    });
  }
}
