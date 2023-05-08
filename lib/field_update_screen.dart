import 'package:api_calling_testing/model/MyModel.dart';
import 'package:flutter/material.dart';

import 'model/api.dart';

class FieldsUpdateScreen extends StatefulWidget {
  final MyModel data;
  const FieldsUpdateScreen({Key? key,required this.data}) : super(key: key);

  @override
  State<FieldsUpdateScreen> createState() => _FieldsUpdateScreenState();
}

class _FieldsUpdateScreenState extends State<FieldsUpdateScreen> {
  var nameController = TextEditingController();
  var emaiController = TextEditingController();
   var ageController = TextEditingController();


  @override
  void initState() {

    super.initState();
    nameController.text = widget.data.name.toString();
    emaiController.text = widget.data.age.toString();
    ageController.text = widget.data.email.toString();

  }

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


                  Api.updateUser(widget.data.sId,{
                    "name" : nameController.text,
                    "age": ageController.text,
                    "email": emaiController.text,
                  });
                  print("..........................done");

              }, child: Text("Upload"))
            ],
          ),
        ));
  }
}
