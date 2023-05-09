import 'dart:convert';

import 'package:api_calling_testing/model/MyModel.dart';
import 'package:http/http.dart'as http;


class Api{
  static const baseUrl = "http://device_ip_address/api/data/";

  static addusers(Map puser)async{

    try{
      final res =  await http.post(Uri.parse("${baseUrl}"),body: puser);

      if(res.statusCode == 200){
       var data = jsonDecode(res.body.toString());
       print(data);
      }else{
        print("Failed to get response");
      }
    }catch(e){
       print(e.toString());
    }
  }

  static getUserData()async{
    List <MyModel> usersList = [];

    try{
      final res = await http.get(Uri.parse("${baseUrl}getdata"));

      if(res.statusCode==200){
        var data = jsonDecode(res.body);

        for(Map<String,dynamic> i in data) {
          usersList.add(MyModel.fromJson(i));
        }
       return usersList;

      }else{
           return [];
      }
    }catch(e){
      print(e.toString());
    }
  }

  static updateUser (id,body) async{
    var url = Uri.parse(baseUrl+"$id");
    final res = await http.put(url,body: body);
    if(res.statusCode == 200){
      print(jsonDecode(res.body));
    }else{
      print("Failed to update data");
    }
  }


  static deleteUser(id)async{
    var url = Uri.parse(baseUrl+"$id");
    final res = await http.delete(url);
    if(res.statusCode == 200){
      print(jsonDecode(res.body));
    }else{
      print("failed to delete");
    }
  }
}
