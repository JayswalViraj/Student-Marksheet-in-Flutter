import 'dart:io';

import 'package:demo_practical/utils.dart/colors.dart';
import 'package:demo_practical/utils.dart/data.dart';
import 'package:demo_practical/pages/list_student.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddStudet extends StatefulWidget {

  String? name="";
  String? cp="";
  String? cpp="";
  String? maths="";
  String? image="";

   AddStudet({super.key,this.name,this.cp,this.cpp,this.maths,this.image});

  @override
  State<AddStudet> createState() => _AddStudetState();
}

class _AddStudetState extends State<AddStudet> {
  final ImagePicker _picker = ImagePicker();
  XFile? pickedImage;

  
  var viewImage= "";



  @override
  Widget build(BuildContext context) {
    widget.image=viewImage;
        return Scaffold(
      appBar: AppBar(title: Text("Simple Marksheet"),backgroundColor: primeryColor,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20,),

                            pickedImage!=null? Image.file(
                                  File(pickedImage!.path.toString()),
                                  height: 100,
                                ):SizedBox(),
  SizedBox(height: 20,),
              InkWell(
                onTap: () async {
                  pickedImage =
                      await _picker.pickImage(source: ImageSource.gallery);
    
widget.image=pickedImage!.path.toString();
                      
                  setState(() {});
                },

                child: Container(
                    width: 100,
                    height: 40,
                    padding: EdgeInsets.all(1),
                    
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Add Image"))),
              ),
              SizedBox(height: 20,),
              TextFormField(
              
        
                initialValue: widget.name,
                onChanged: (value) {
                 widget.name=value;
                },
                decoration: InputDecoration(
                  
                  labelText: "Name",
                  border: const OutlineInputBorder(),
                ),
              ),
                SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                 onChanged: (value) {
                  widget.maths=value;
                },
                
                 initialValue: widget.maths,
            
                decoration: InputDecoration(
                  labelText: "Maths",
                  border: const OutlineInputBorder(),
                ),
              ),
                SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                 initialValue: widget.cp,
            onChanged: (value) {
                  widget.cp=value;
                },
                decoration: InputDecoration(
                  labelText: "Computer Programming",
                  border: const OutlineInputBorder(),
                ),
              ),
                SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                 initialValue: widget.cpp,
                onChanged: (value) {
                  widget.cpp=value;
                },
                decoration: InputDecoration(
                  labelText: "C++",
                  border: const OutlineInputBorder(),
                ),
              ),
  SizedBox(height: 20,),
           
              ElevatedButton(
                  onPressed: () {
                    int maths = int.parse(widget.maths.toString());
                    int cp = int.parse(widget.cp.toString());
                    int cpp = int.parse(widget.cpp.toString());
                    int sum = maths + cp + cpp;     
  var percentage = (sum / 300.0) * 100;
      
                    studentList.add({
                      "Name": widget.name.toString(),
                        "Image":widget.image.toString(),
                      "Maths": maths.toString(),
                      "CP": cp.toString(),
                      "C++": cpp.toString(),
                      "PR": percentage.toString()
                    });
      print("Print image"+widget.image.toString());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListStudent()));

   
                  },
                  child: Text("Add")),
                    SizedBox(height: 5,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListStudent()));
                  },
                  child: Text("View All Studetnt List")),
            ],
          ),
        ),
      ),
    );
  }

  

}
