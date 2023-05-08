import 'package:api_calling_testing/createscreen.dart';
import 'package:api_calling_testing/latestone.dart';
import 'package:api_calling_testing/mongoselecthomescreen.dart';

import 'package:flutter/material.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectCategory(),
      title: "API TESTING",
    );
  }
}
