import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_manager/db/model/model.dart';
import 'package:student_manager/screens/home_screen/home_screen.dart';

void main(List<String> args) async{

  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();

  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.black,
      ),
      home:const  HomePage(),
    );
  }
}
