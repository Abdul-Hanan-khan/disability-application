import 'package:disability_application/api//services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:disability_application/api//componants/customListTile.dart';
import 'model/article_model.dart';

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
//       home: NewsHome(),
//     );
//   }
// }

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NewsApp",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: client.getArticle(),
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                // itemBuilder: (context, index) => customListTile(articles[index],context),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}