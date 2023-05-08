import 'package:api_calling_testing/createscreen.dart';
import 'package:api_calling_testing/deletescreen.dart';
import 'package:api_calling_testing/fetch_data.dart';
import 'package:api_calling_testing/updatescreen.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Any One"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateScreen(),));
          }, child: Text("Create")),
          ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => FetchData(),));}, child: Text("Read")),
          ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateScreen(),));}, child: Text("Update")),
          ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteScreen(),));}, child: Text("Delete")),
        ],
      ),
    );
  }
}
