
//Now let's create the article details page

import 'package:disability_application/api/model/article_model.dart';
import 'package:disability_application/api/pages/view_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {

  final Article article;

  ArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    String imageUrl=article.urlToImage;
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(article.source.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  //let's add the height

                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onTap:(){
                // Navigator.push(context, MaterialPage(child: (context)=>ViewImage(imageUrl)));
              },
            ),
            Container(
              height: 300,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.teal),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20) )
              ),
              child: Column(children: [

                SizedBox(
                  height: 20.0,
                ),
                Container(width: 100,color: Colors.blue,height: 3,),
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    article.source.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                    ),
                  ),
                ),
                Container(width: 100,color: Colors.blue,height: 3,),
                Container(margin: EdgeInsets.only(top: 5), width: size.width,color: Colors.teal,height: 1,),
                SizedBox(
                  height: 15.0,
                ),
                Text("      "+
                  article.description,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}