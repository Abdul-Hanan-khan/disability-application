import 'dart:ui';
import 'package:disability_application/api/model/article_model.dart';
import 'package:disability_application/api/pages/articles_pages_details.dart';
import 'package:flutter/material.dart';
Widget customListTile(Article article,context){
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                article: article,
              )));
    },
    child: SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6,sigmaY: 6),
          child: Container(
            width: 210,
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.blue),
              // gradient: LinearGradient(colors: [Colors.lightBlue.withOpacity(0.2),Colors.lightBlue.withOpacity(0.05)],
              //     begin: Alignment.topLeft,end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(

                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(article.source.name.length>11 ? article.source.name.substring(0,9)+"...":article.source.name
                        , style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 3,),
                    Text(article.title.length>16 ?article.title.substring(0,16)+"...":article.title
                      ,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),


                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 5,right: 5),
                  color: Colors.blue,
                  height: 110,
                  // child: Icon(Icons.wheelch),
                  width: 2,
                ),
                CircleAvatar(
                  radius: 38.0,
                  // backgroundImage: NetworkImage(article.urlToImage),
                  //   backgroundImage: (profile.imgUrl == null) ?
                  //   AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl),
                  backgroundImage: (article.urlToImage != null) ? NetworkImage(article.urlToImage):AssetImage("assets/mental.png")
                   
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}