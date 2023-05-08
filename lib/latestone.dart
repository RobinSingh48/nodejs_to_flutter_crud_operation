// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class NewHomeScreen extends StatefulWidget {
//   const NewHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NewHomeScreen> createState() => _NewHomeScreenState();
// }
//
// class _NewHomeScreenState extends State<NewHomeScreen> {
//   List data = [];
//   final _formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final ageController = TextEditingController();
//   final emailController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
// //mongodb+srv://robin:rr1234@cluster0.4slahho.mongodb.net/notesdb
//   Future<void> fetchData() async {
//     final response =
//         await http.get(Uri.parse('http://192.168.0.101:3000/api/data'));
//     if (response.statusCode == 200) {
//       setState(() {
//         data = jsonDecode(response.body);
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//
//   Future<void> addData() async {
//     final response =
//         await http.post(Uri.parse('http://192.168.0.101:3000/api/data'), body: {
//       'name': nameController.text,
//       'age': ageController.text,
//       'email': emailController.text,
//     });
//     if (response.statusCode == 200) {
//       fetchData();
//       nameController.clear();
//       ageController.clear();
//       emailController.clear();
//     } else {
//       throw Exception('Failed to add data');
//     }
//   }
//
//   Future<void> updateData(String id) async {
//     final response =
//         await http.put(Uri.parse('http://192.168.0.101:3000/api/data/$id'), body: {
//       'name': nameController.text,
//       'age': ageController.text,
//       'email': emailController.text,
//     });
//     if (response.statusCode == 200) {
//       fetchData();
//       nameController.clear();
//       ageController.clear();
//       emailController.clear();
//     } else {
//       throw Exception('Failed to update data');
//     }
//   }
//
//   Future<void> deleteData(String id) async {
//     final response =
//         await http.delete(Uri.parse('http://192.168.0.101:3000/api/data/$id'));
//     if (response.statusCode == 200) {
//       fetchData();
//     } else {
//       throw Exception('Failed to delete data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter MongoDB Demo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Add data',
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
//             SizedBox(height: 16.0),
//             Form(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: nameController,
//                       decoration: InputDecoration(
//                         labelText: 'Name',
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter a name';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 8.0),
//                     TextFormField(
//                       controller: ageController,
//                       decoration: InputDecoration(
//                         labelText: 'Age',
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter an age';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 8.0),
//                     TextFormField(
//                       controller: emailController,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter an email';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                          setState(() {
//                            addData();
//                          });
//                         }
//                       },
//                       child: Text('Add'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Text('Data',
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
//             SizedBox(height: 16.0),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     title: Text(data[index]['name']),
//                     subtitle: Text(
//                         '${data[index]['age']} years old, ${data[index]['email']}'),
//                     trailing: IconButton(
//                       icon: Icon(Icons.delete),
//                       onPressed: () {
//                         deleteData(data[index]['_id']);
//                       },
//                     ),
//                     onTap: () {
//                       nameController.text = data[index]['name'];
//                       ageController.text = data[index]['age'].toString();
//                       emailController.text = data[index]['email'];
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: Text('Update data'),
//                             content: Form(
//                               key: _formKey,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   TextFormField(
//                                     controller: nameController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Name',
//                                     ),
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return 'Please enter a name';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   TextFormField(
//                                     controller: ageController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Age',
//                                     ),
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return 'Please enter an age';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   TextFormField(
//                                     controller: emailController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Email',
//                                     ),
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return 'Please enter an email';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             actions: [
//                               ElevatedButton(
//                                 onPressed: () {
//                                   if (_formKey.currentState!.validate()) {
//                                     updateData(data[index]['_id']);
//                                     Navigator.of(context).pop();
//                                   }
//                                 },
//                                 child: Text('Save'),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
