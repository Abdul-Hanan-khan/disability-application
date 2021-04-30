import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class Epilepsy extends StatefulWidget {
  @override
  _EpilepsyState createState() => _EpilepsyState();
}

class _EpilepsyState extends State<Epilepsy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Epilepsy"),
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
                        "https://th.bing.com/th/id/OIP.lGHvPpvxLya5y4jaS0pBgQHaE8?w=237&h=180&c=7&o=5&pid=1.7"),
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
                        "https://th.bing.com/th/id/OIP.x6GLNY5M2N92KqZkNhEI_QHaGr?w=174&h=180&c=7&o=5&pid=1.7"),
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
                        "https://th.bing.com/th/id/OIP.K5dqIhRHeeZJmN0vdGiV1AHaE7?w=266&h=180&c=7&o=5&pid=1.7"),
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
                        "https://th.bing.com/th/id/OIP.oHCtBS7LosJ2KgU47lvHGAHaEo?w=295&h=184&c=7&o=5&pid=1.7"),
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
                "       Epilepsy is a central nervous system (neurological) disorder in which brain activity becomes abnormal, causing seizures or periods of unusual behavior, sensations, and sometimes loss of awareness.Anyone can develop epilepsy. Epilepsy affects both males and females of all races, ethnic backgrounds and ages",
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
