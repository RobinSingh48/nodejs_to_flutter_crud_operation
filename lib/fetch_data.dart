import 'package:flutter/material.dart';

import 'model/MyModel.dart';
import 'model/api.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
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

                    leading: Icon(Icons.storage),
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
