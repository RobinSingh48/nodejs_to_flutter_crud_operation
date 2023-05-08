
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




import 'model/api.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreen createState() => _CreateScreen();
}

class _CreateScreen extends State<CreateScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emaiController = TextEditingController();
  TextEditingController ageController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My API Screen'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Enter Name",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  decoration: InputDecoration(
                      hintText: "age",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emaiController,
                  decoration: InputDecoration(
                      hintText: "email",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      )),
                ),
              ),

              ElevatedButton(onPressed: (){
               setState(() {
                  var data = {
                    "name" : nameController.text,
                    "age": ageController.text,
                        "email": emaiController.text,
                  };
                  Api.addusers(data);
                 print("..........................done");
               });
              }, child: Text("Upload"))
            ],
          ),
        ));
  }
}
