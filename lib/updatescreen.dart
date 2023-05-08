import 'package:api_calling_testing/field_update_screen.dart';
import 'package:flutter/material.dart';

import 'model/MyModel.dart';
import 'model/api.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("UserData"),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: Api.getUserData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<MyModel> userdata = snapshot.data;

              return ListView.builder(
                itemCount: userdata.length,
                itemBuilder: (BuildContext context, index) {
                  print(".......................................................${userdata[index].name}");
                  return ListTile(

                    leading:ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FieldsUpdateScreen(data: userdata[index]),));
                      },
                      child: Icon(Icons.edit),
                    ),
                    title: Text("${userdata[index].name}",),

                    subtitle: Text("${userdata[index].age}"),
                    trailing: Text("${userdata[index].email}"),
                  );
                },
              );
            }
          },
        ));
  }
}
