import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_manager/db/functions/functions.dart';
import 'package:student_manager/screens/Inner_screen.dart/inner_screen_functions.dart';

import '../../db/model/model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: 400,
        height: 850,
        child: ValueListenableBuilder(
          valueListenable: studentList,
          builder: (BuildContext ctx, List<StudentModel> studentList,
              Widget? child) {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = studentList[index];

                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => InnerTile(
                              index: index,
                            ))));
                  },
                  title: Text(' ${data.name}'),
                  leading: data.image != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(File(data.image)))
                      : CircleAvatar(),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 255, 91, 79),
                    ),
                    onPressed: () {
                      deletTile(data);
                    },
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: studentList.length,
            );
          },
        ),
      ),
    );
  }
}
