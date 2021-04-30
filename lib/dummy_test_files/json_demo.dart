// import 'dart:convert';
// import 'package:disability_application/model/news.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart';
// import 'package:async/async.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: JsonDemo(),
//     );
//   }
// }
//
// class JsonDemo extends StatefulWidget {
//   @override
//   _JsonDemoState createState() => _JsonDemoState();
// }
//
// class _JsonDemoState extends State<JsonDemo> {
//   void getJsonData() async {
//     // Response response= await http.get(Uri.encodeFull('uri'));
//     Response response = await get("http://jsonplaceholder.typicode.com/users");
//     List data = jsonDecode(response.body);vvb
//     data.forEach((element) {
//       Map obj = element;
//       String name = obj['name'];
//       print("Name :" + name);
//       String street = obj['address']['street'];
//       print("Street :" + street);
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getJsonData();
//     fetchNews().then((value) {
//       setState(() {
//         _news.addAll(value);
//       });
//     });
//   }
//
//   List<News> _news = List<News>();
//
//   Future<List<News>> fetchNews() async {
//     var newsUrl = 'http://jsonplaceholder.typicode.com/users';
//     var response = await http.get(newsUrl);
//
//     var news = List<News>();
//     if (response.statusCode == 200) {
//       print(response.body);
//       var newsJson = jsonDecode(response.body);
//       for (var data in newsJson) {
//         // print(data['street']);
//         news.add(News.fromJson(data));
//       }
//     }
//     return news;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int recordNo = 0;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Json Demo"),
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           recordNo = index + 1;
//           return Card(
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Text("Record No :$recordNo"),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text("Name :"+
//                           _news[index].name.toString(),
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text("Street :"+
//                           _news[index].street.toString()
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         itemCount: _news.length,
//       ),
//     );
//   }
// }
