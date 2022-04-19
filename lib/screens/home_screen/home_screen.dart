import 'package:flutter/material.dart';
import 'package:student_manager/db/functions/functions.dart';
import 'package:student_manager/screens/add_screen/add_screen.dart';
import 'package:student_manager/screens/home_screen/search_bar.dart';

import 'home_screen_render.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  
  

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 247, 255),
      body: const HomeScreen(),
      floatingActionButton: homeFloatButton(context),
      appBar: homeAppBar(context),
    );
  }
}

AppBar homeAppBar(context) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 40, 132, 207),
    actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Mysearch());
              },
              icon: const Icon(Icons.search))
        ],
  );
}

Widget homeFloatButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const AddScreen() )));
      },
      child: const Icon(Icons.add),
      backgroundColor: Color.fromARGB(255, 57, 57, 187),
    ),
  );
}
