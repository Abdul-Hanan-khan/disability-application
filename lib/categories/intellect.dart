import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Intellect extends StatefulWidget {
  @override
  _IntellectState createState() => _IntellectState();
}

class _IntellectState extends State<Intellect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intellect"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.blue, width: 2.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://th.bing.com/th/id/OIP.QWFjx4w4HrThOjUkJ8N83AHaEK?pid=ImgDet&rs=1"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.blue, width: 2.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://th.bing.com/th/id/OIP.ltm3p2snTMvMk0g80PbGjgHaD4?w=326&h=180&c=7&o=5&pid=1.7"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.blue, width: 2.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://th.bing.com/th/id/OIP.YqvhUH9SgtyKrWkuVJSXSAHaJ4?w=132&h=180&c=7&o=5&pid=1.7"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.blue, width: 2.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://th.bing.com/th/id/OIP.s5U7YeNf-buGm-QhAmnqjgHaE7?w=257&h=180&c=7&o=5&pid=1.7"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 300.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "       Intellectual disability has been documented under a variety of names throughout history. Throughout much of human history, society was unkind to those with any type of disability, and people with intellectual disability were commonly viewed as burdens on their families",
                textAlign: TextAlign.justify,
                style: GoogleFonts.comfortaa(fontSize: 16, color: Colors.black),

              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.blue[300],
                    onPressed:joinGroup,
                    child: Text("Join Group",style: TextStyle(color: Colors.white),),
                    elevation: 5,
                    splashColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  joinGroup(){
    String phone="+923156087872";
    var whatsappUrl ="whatsapp://send?phone=$phone";
    var whatsAppGroupUrl="https://chat.whatsapp.com/HV9dwPdVjUCISj1dNeMKWr";
    launch(whatsAppGroupUrl) != null? launch(whatsAppGroupUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
    // launch();
  }
}
