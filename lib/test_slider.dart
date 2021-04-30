import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GFG Slider"),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              //1st Image of Slider
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 20),
                child: Card(
                  elevation: 10,
                  child: Container(
                    width: 210,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blue, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(6)),
                    // child: Text(title[index]),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 8, bottom: 8, right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "subtitle",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 2,
                          height: 100,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.blue),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Icon(
                                  Icons.accessibility_new_sharp,
                                  color: Colors.blue,
                                  size: 60,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 20),
                child: Card(
                  elevation: 10,
                  child: Container(
                    width: 210,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blue, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(6)),
                    // child: Text(title[index]),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 8, bottom: 8, right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "subtitle",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 2,
                          height: 100,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.blue),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Icon(
                                  Icons.accessibility_new_sharp,
                                  color: Colors.blue,
                                  size: 60,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 20),
                child: Card(
                  elevation: 10,
                  child: Container(
                    width: 210,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blue, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(6)),
                    // child: Text(title[index]),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 8, bottom: 8, right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "subtitle",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 2,
                          height: 100,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.blue),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Icon(
                                  Icons.accessibility_new_sharp,
                                  color: Colors.blue,
                                  size: 60,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 20),
                child: Card(
                  elevation: 10,
                  child: Container(
                    width: 210,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blue, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(6)),
                    // child: Text(title[index]),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 8, bottom: 8, right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "subtitle",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 2,
                          height: 100,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.blue),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Icon(
                                  Icons.accessibility_new_sharp,
                                  color: Colors.blue,
                                  size: 60,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 20),
                child: Card(
                  elevation: 10,
                  child: Container(
                    width: 210,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blue, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(6)),
                    // child: Text(title[index]),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 8, bottom: 8, right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "subtitle",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 2,
                          height: 100,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.blue),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Icon(
                                  Icons.accessibility_new_sharp,
                                  color: Colors.blue,
                                  size: 60,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 20),
                child: Card(
                  elevation: 10,
                  child: Container(
                    width: 210,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blue, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(6)),
                    // child: Text(title[index]),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 8, bottom: 8, right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "subtitle",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 2,
                          height: 100,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.blue),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Icon(
                                  Icons.accessibility_new_sharp,
                                  color: Colors.blue,
                                  size: 60,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              //2nd Image of Slider
              // Container(
              //   margin: EdgeInsets.all(6.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8.0),
              //     image: DecorationImage(
              //       image: NetworkImage(
              //           "https://th.bing.com/th/id/OIP.tZOgBHcsBeDsLveTHIyh2AHaEo?pid=ImgDet&rs=1"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              //
              // //3rd Image of Slider
              // Container(
              //   margin: EdgeInsets.all(6.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8.0),
              //     image: DecorationImage(
              //       image: NetworkImage(
              //           "https://th.bing.com/th/id/OIP.bOpmvPTMEqge4JxD6iRigAHaEo?pid=ImgDet&rs=1"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              //
              // //4th Image of Slider
              // Container(
              //   margin: EdgeInsets.all(6.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8.0),
              //     image: DecorationImage(
              //       image: NetworkImage(
              //           "https://th.bing.com/th/id/R32f71a689bf28cf36f2124de35fe4468?rik=ZXDq3dAYo04tBw&riu=http%3a%2f%2fwww.wallpapersin4k.org%2fwp-content%2fuploads%2f2017%2f04%2fVery-Very-Beautiful-Wallpapers-Of-Nature-1.jpg&ehk=0DymixcH1iJDpRvDiOwhYcY13dLVb7GTAFUUximr49A%3d&risl=&pid=ImgRaw"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              //
              // //5th Image of Slider
              // Container(
              //   margin: EdgeInsets.all(6.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8.0),
              //     image: DecorationImage(
              //       image: NetworkImage(
              //           "https://th.bing.com/th/id/OIP.6ADHytzuEEHqnQIbDbrm_QHaEo?w=290&h=181&c=7&o=5&dpr=1.25&pid=1.7"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.59,
            ),
          ),
        ],
      ),
    );
  }
}
