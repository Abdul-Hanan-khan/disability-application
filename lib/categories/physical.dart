import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class Physical extends StatefulWidget {
  @override
  _PhysicalState createState() => _PhysicalState();
}

class _PhysicalState extends State<Physical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Physical"),
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
                        "https://i0.wp.com/diyhealth.com/wp-content/uploads/2017/07/handling-children-with-physical-disabilities-2.jpg?resize=800%2C533&ssl=1"),
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
                        "https://th.bing.com/th/id/OIP.51rmSy0SudofLyA9mTO-QwHaE8?pid=ImgDet&rs=1"),
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
                        "https://th.bing.com/th/id/Ra59d05a03623dbacc858c56c584c2c34?rik=UfPn3ttyB18A6g&riu=http%3a%2f%2fwww.dailyherald.com%2fstoryimage%2fDA%2f20110726%2fnews%2f707269857%2fEP%2f1%2f1%2fEP-707269857.jpg%26updated%3d201107261510%26MaxW%3d800%26maxH%3d800%26noborder&ehk=AyjBb8qPPXTNzi1f3QCPD1qR0LT%2font9UsFgvANj09U%3d&risl=&pid=ImgRaw"),
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
                        "https://www.carewatch.co.uk/wp-content/uploads/2018/04/1000x1000-physical-disability-support-min.jpg"),
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
                "       Balance disorders can be caused by certain health conditions, medications, or a problem in the inner ear or the brain. A balance disorder can profoundly affect daily activities and cause psychological and emotional hardship.",
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
