import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_manager/db/functions/functions.dart';
import 'package:student_manager/screens/edit_screen/edit_screen_functions.dart';

import '../../common_fuctions.dart';
import '../../db/model/model.dart';

class InnerTile extends StatelessWidget {

  
   
  final index;
  const InnerTile({Key? key,required this.index }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => EditScreen(index: index,))));

      }, icon: Icon(Icons.edit))],),
      body: tileRender(index),
    );
  }

  Widget tileRender(int index) {
    getAllStudents();
   
    
    
    return ValueListenableBuilder(
      
      valueListenable: studentList,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {

            final data = studentList[index];
            
        return  Container(
              width: double.infinity,
              child: Column(children: [
                gap(Height: 30, Width: 0),
                data.image == null
                    ? const CircleAvatar(
                        radius: 120,
                      )
                    : CircleAvatar(
                        radius: 120,
                        backgroundImage: FileImage(File(data.image)),
                      ),
                gap(Height: 60, Width: 0),
                Container(
                  child: Column(children: [
                    Center(
                      child: Container(
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Name  : ${data.name}", style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),),
                            Text("Age  : ${data.age}", style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            )),
                          ],
                        ),
                      ),
                    ),
                    gap(Height: 30, Width: 0),
                    Center(
                      child: Container(
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("College  : ${data.school}", style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            )),
                            Text("Phone  : ${data.phone}", style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            )),
                          ],
                        ),
                      ),
                    )
                  ]),
                )
              ]),
            );
      },
    );
  }



}





// return Container(
//               width: double.infinity,
//               child: Column(children: [
//                 gap(Height: 30, Width: 0),
//                 data.image == null
//                     ? const CircleAvatar(
//                         radius: 120,
//                       )
//                     : CircleAvatar(
//                         radius: 120,
//                         backgroundImage: FileImage(File(data.image)),
//                       ),
//                 gap(Height: 60, Width: 0),
//                 Container(
//                   child: Column(children: [
//                     Center(
//                       child: Container(
//                         width: 400,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text("Name  : ${data.name}", style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold
//                             ),),
//                             Text("Age  : ${data.age}", style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold
//                             )),
//                           ],
//                         ),
//                       ),
//                     ),
//                     gap(Height: 30, Width: 0),
//                     Center(
//                       child: Container(
//                         width: 400,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text("College  : ${data.school}", style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold
//                             )),
//                             Text("Phone  : ${data.phone}", style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold
//                             )),
//                           ],
//                         ),
//                       ),
//                     )
//                   ]),
//                 )
//               ]),
//             );