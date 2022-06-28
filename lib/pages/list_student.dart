import 'dart:io';

import 'package:demo_practical/pages/add_student.dart';
import 'package:demo_practical/utils.dart/colors.dart';
import 'package:demo_practical/utils.dart/data.dart';
import 'package:demo_practical/pages/edit.dart';
import 'package:demo_practical/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListStudent extends StatefulWidget {
  const ListStudent({super.key});

  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Simple Marksheet"), backgroundColor: primeryColor),
        body: Center(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Table(
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Text('Name', style: TextStyle(fontSize: 15.0))
                    ]),
                    Column(children: [
                      Text('Image', style: TextStyle(fontSize: 15.0))
                    ]),
                    Column(children: [
                      Text('Maths', style: TextStyle(fontSize: 15.0))
                    ]),
                    Column(children: [
                      Text('CP', style: TextStyle(fontSize: 15.0))
                    ]),
                    Column(children: [
                      Text('C++', style: TextStyle(fontSize: 15.0))
                    ]),
                    Column(children: [
                      Text('PR', style: TextStyle(fontSize: 15.0))
                    ]),
                    Column(children: [
                      Text('Edit', style: TextStyle(fontSize: 15.0))
                    ]),
                    Column(children: [
                      Text('Delete', style: TextStyle(fontSize: 15.0))
                    ]),
                  ]),
                  for (int i = 0; i < studentList.length; i++) ...[
                    TableRow(children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Text(studentList[i]["Name"])]),
                      Column(children: [
                        studentList[i]["Image"] == "" ||
                                studentList[i]["Image"] == null
                            ? Icon(
                                Icons.person_off_outlined,
                                size: 35,
                              )
                            : Image.file(
                                File(studentList[i]["Image"]),
                                height: 50,
                              )
                      ]),
                      Column(children: [Text(studentList[i]["Maths"])]),
                      Column(children: [Text(studentList[i]["CP"])]),
                      Column(children: [Text(studentList[i]["C++"])]),
                      Column(children: [
                        Text(studentList[i]["PR"].toString() + "%")
                      ]),
                      Column(children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Edit(
                                      name: studentList[i]["Name"],
                                      cp: studentList[i]["CP"],
                                      cpp: studentList[i]["C++"],
                                      maths: studentList[i]["Maths"],
                                      pos: i,
                                      image: studentList[i]["Image"],
                                    ),
                                  ));
                            },
                            icon: Icon(Icons.edit))
                      ]),
                      Column(children: [
                        IconButton(
                            onPressed: () {
                              studentList.removeAt(i);
                              setState(() {});
                            },
                            icon: Icon(Icons.delete))
                      ]),
                    ]),
                  ]
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddStudet()));
                },
                child: Text("Add New Student"))
          ]),
        ));
  }
}
