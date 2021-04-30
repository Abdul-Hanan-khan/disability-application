import 'dart:io';

import 'package:disability_application/api/componants/customListTile.dart';
import 'package:disability_application/categories/albinism.dart';
import 'package:disability_application/categories/epilepsy.dart';
import 'package:disability_application/categories/intellect.dart';
import 'package:disability_application/categories/mental.dart';
import 'package:disability_application/categories/physical.dart';
import 'package:disability_application/categories/sensory.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:url_launcher/url_launcher.dart';


import 'package:disability_application/api/model/article_model.dart';



import 'package:http/http.dart'as http;
import 'dart:convert';
import 'api/services/api_service.dart';
import 'drawer/profile.dart';
import 'drawer/settings.dart';
import 'login_screen.dart';
import 'model/news.dart';
import 'package:flutter/foundation.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticating = false;
  bool _authorized = false;

  ApiService client = ApiService();
  final formKey=GlobalKey<FormState>();



  var fNameCtr = TextEditingController();
  var lNameCtr = TextEditingController();
  var mobileNoCtr = TextEditingController();
  var emailCtr = TextEditingController();
  var passwordCtr = TextEditingController();
  var nationalityCtr = TextEditingController();
  bool valuefirst = false;
  String birthDateInString;
  DateTime birthDate;
  bool isDateSelected;

  // Future<bool> onWillPop() {
  //   return showDialog(
  //     barrierColor: Colors.blue.withOpacity(0.4),
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       backgroundColor: Colors.white,
  //       shape:
  //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //       title: Row(
  //         children: [
  //           Container(
  //             decoration:
  //             BoxDecoration(borderRadius: BorderRadius.circular(20)),
  //             child: Icon(
  //               Icons.add_alert,
  //               color: Colors.blue,
  //               size: 30,
  //             ),
  //           ),
  //           SizedBox(
  //             width: 10,
  //           ),
  //           Text(
  //             'Are you sure?',
  //             style: TextStyle(color: Colors.red, fontSize: 20),
  //           ),
  //         ],
  //       ),
  //       content: Padding(
  //         padding: const EdgeInsets.only(left: 40),
  //         child: Text(
  //           'Do you want to exit.',
  //           style: TextStyle(color: Colors.blue),
  //         ),
  //       ),
  //       actions: <Widget>[
  //         FlatButton(
  //           onPressed: () => Navigator.of(context).pop(false),
  //           child: Text('No', style: TextStyle(color: Colors.blue)),
  //         ),
  //         FlatButton(
  //           onPressed: () => exit(0),
  //           child: Text('Yes', style: TextStyle(color: Colors.red)),
  //         ),
  //       ],
  //     ),
  //   ) ??
  //       false;
  // }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: new Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Abdul Hanan"),
              accountEmail: Text("hanankhanajk@gmail.com"),
              currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        "https://p1.hiclipart.com/preview/823/765/288/login-icon-system-administrator-user-user-profile-icon-design-avatar-face-head-png-clipart.jpg"),
                  ),
                  onTap: () => print("Current User")),

              //.. This line of code provides the usage of multiple accounts
              /* otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: ()=> switchUser(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(otherProfilePic)
                  ),
                ),
              ], */

              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://png.pngtree.com/thumb_back/fh260/background/20190828/pngtree-dark-vector-abstract-background-image_302715.jpg")),
              ),
            ),
            ListTile(
                title: Text("Home Page"),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(
                  //   new MaterialPageRoute(
                  //     builder: (BuildContext context) => OtherPage("Home Page"),
                  //   ),
                  // );
                }),
            ListTile(
                title: Text("Profile"),
                trailing: Icon(Icons.info),
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ProfileScreen(),
                  ));
                }),
            ListTile(
                title: Text("save image test"),
                trailing: Icon(Icons.question_answer),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(new MaterialPageRoute(
                  //   builder: (BuildContext context) => OtherPage("About Page"),
                  // ));
                }),
            ListTile(
                title: Text("Support"),
                trailing: Icon(Icons.contact_support_sharp),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(new MaterialPageRoute(
                  //   builder: (BuildContext context) => OtherPage("About Page"),
                  // ));
                }),
            ListTile(
                title: Text("Settings Page"),
                trailing: Icon(Icons.security),
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Setting(),
                  ));
                }),
            Divider(
              thickness: 1.0,
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.cancel),
              onTap: () {FlutterSession().set("status", false);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
            ),
          ],
        )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Colors.green[200])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Text(
                            "SOS",
                            style: GoogleFonts.comfortaa(
                                fontSize: 17, color: Colors.black),
                          ),
                        ),
                      ),
                      onTap: () {
                        calll();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 50, right: 50),
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Text("Category",
                    style: GoogleFonts.comfortaa(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, top: 20),
                      child: Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              width: 70,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Image.asset(
                                "assets/mental.png",

                                width: 50,
                                height: 60,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Center(
                                  child: Text("Albinism",
                                      style: GoogleFonts.ubuntuCondensed(
                                          fontSize: 15, color: Colors.black)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>Albinism()));
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              width: 70,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Image.asset(
                                "assets/mental.png",
                                width: 50,
                                height: 60,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Center(
                                  child: Text(
                                    "Mental",
                                    style: GoogleFonts.ubuntuCondensed(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {Navigator.push(context,MaterialPageRoute(builder: (_)=>Mental()));},
                  ),
                  GestureDetector(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 20, right: 10),
                      child: Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              width: 70,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Image.asset(
                                "assets/mental.png",
                                width: 50,
                                height: 60,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Center(
                                  child: Text("Physical",
      style: GoogleFonts.ubuntuCondensed(
      fontSize: 15, color: Colors.black),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {Navigator.push(context,MaterialPageRoute(builder: (_)=>Physical()));},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, top: 20),
                      child: Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              width: 70,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child:Image.asset(
                                "assets/mental.png",
                                width: 50,
                                height: 60,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Center(
                                  child: Text("Sensory",
                                    style: GoogleFonts.ubuntuCondensed(
                                        fontSize: 15, color: Colors.black),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>Sensory()));
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              width: 70,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Image.asset(
                                "assets/mental.png",
                                width: 50,
                                height: 60,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Center(
                                  child: Text("Intellect",
                                    style: GoogleFonts.ubuntuCondensed(
                                        fontSize: 15, color: Colors.black),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {Navigator.push(context,MaterialPageRoute(builder: (_)=>Intellect()));},
                  ),
                  GestureDetector(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 20, right: 10),
                      child: Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              width: 70,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child:Image.asset(
                                "assets/mental.png",
                                width: 50,
                                height: 60,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Center(
                                  child: Text("Epilepsy",
                                    style: GoogleFonts.ubuntuCondensed(
                                        fontSize: 15, color: Colors.black),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {Navigator.push(context,MaterialPageRoute(builder: (_)=>Epilepsy()));},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Text("Latest News",
                    style: GoogleFonts.comfortaa(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
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
                        itemBuilder: (context, index) => customListTile(articles[index],context),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),

            // data.isNotEmpty ? SizedBox(
            //     height: 170.0,
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: data.length,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.only(
            //               left: 10, right: 10, top: 10, bottom: 20),
            //           child: Card(
            //             elevation: 10,
            //             child: Container(
            //               width: 250,
            //               margin: const EdgeInsets.symmetric(horizontal: 1.0),
            //               decoration: BoxDecoration(
            //                   border: Border.all(
            //                       color: Colors.blue, style: BorderStyle.solid),
            //                   borderRadius: BorderRadius.circular(6)),
            //               // child: Text(title[index]),
            //               child: Row(
            //                 mainAxisSize: MainAxisSize.max,
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 8, top: 8, bottom: 8, right: 5),
            //                     child: Column(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Text("data[index]['title']",
            //                           overflow: TextOverflow.ellipsis,
            //                           style: GoogleFonts.raleway(
            //                               fontSize: 16, color: Colors.black,
            //                           fontWeight: FontWeight.bold),
            //
            //                         ),
            //                         SizedBox(
            //                           height: 10,
            //                         ),
            //                         Text(
            //                           "_news[index].description.length >9 ? _news[index].description.substring(0,9)+"":_news[index].description",
            //                           style: GoogleFonts.raleway(
            //                               fontSize: 15, color: Colors.black),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   Container(
            //                     margin: EdgeInsets.only(right: 5),
            //                     width: 2,
            //                     height: 100,
            //                     color: Colors.blue,
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.only(right: 5),
            //
            //                     child: CircleAvatar(
            //                       radius: 50,
            //                       backgroundImage: NetworkImage("https://media.istockphoto.com/photos/good-news-concept-metal-letterpress-type-picture-id479607780?k=6&m=479607780&s=612x612&w=0&h=Y_wAU6OeaHRVdpHARgQkOiXM7OX2JTl5zFU-zJZazW0="),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ) : Center(child: CircularProgressIndicator()),


              SizedBox(
                height: 40,
              ),


            ],
          ),
        ),
      ),
    );
  }
  calll(){
    String phone="tel:911";
    print("Sos Detected here right noew");
    try{
      launch(phone);
    }
    catch(e){
      print("Got a problem like =========="+e);
    }

  }
  Future<bool> onWillPop( ) {
    return showDialog(
      barrierColor: Colors.blue.withOpacity(0.4),
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.add_alert,
                color: Colors.blue,
                size: 30,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Are you sure?',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ],
        ),
        content: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Do you want to exit.',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No', style: TextStyle(color: Colors.blue)),
          ),
          FlatButton(
            onPressed: () => exit(0),
            child: Text('Yes', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    ) ??
        false;
  }



}
