import 'package:disability_application/variables/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_session/flutter_session.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => new _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userRef = FirebaseFirestore.instance.collection('Users');

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneNoController = TextEditingController();

  String updatedName;
  String updatedEmail;
  String updatedPassword;
  String updatedPhoneNumber;

  bool editAble = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // getUserLoggedIn().then((value) => getUserById());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              ClipPath(
                child: Container(color: Colors.black.withOpacity(0.8)),
                clipper: getClipper(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 5,
                left: MediaQuery.of(context).size.width / 3.4,
                child: Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.white)
                        ])),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.white)
                            ]),
                        child: Icon(
                          Icons.edit,
                        ),
                      ),
                      onTap: () {
                        // editAble=true?editAble=false: editAble=true;

                          if (editAble) {
                            setState(() {
                              editAble = false;
                            });
                          } else{
                            setState(() {
                              editAble = true;
                            });
                          }
                          // print("eidtable ====="+editAble.toString());

                      },
                    )
                  ],
                ),
              ),
              Positioned(
                  width: 350.0,
                  top: MediaQuery.of(context).size.height / 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        !editAble ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Variables.first_name+" "+Variables.last_name,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ) :
                        Padding(
                          padding:
                          // const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          const EdgeInsets.only(
                            left: 35,
                            right: 35,
                          ),
                          child: TextFormField(
                            controller: firstNameController,
                            autofocus: true,
                            onSaved: (String value) {},
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () => firstNameController.clear(),
                              ),
                              labelText: 'First Name',
                              hintText: 'Enter First Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle:
                              TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        !editAble ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Variables.email,
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ],
                              ) : Padding(
                                padding:
                                    // const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                    const EdgeInsets.only(
                                  left: 35,
                                  right: 35,
                                ),
                                child: TextFormField(
                                  controller: lastNameController,
                                  autofocus: true,
                                  onSaved: (String value) {},
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.cancel),
                                      onPressed: () => lastNameController.clear(),
                                    ),
                                    labelText: 'Last Name',
                                    hintText: 'Last Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                        SizedBox(height: 25.0),
                        !editAble
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Variables.password,
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ],
                              )
                            : Padding(
                                padding:
                                    // const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                    const EdgeInsets.only(
                                  left: 35,
                                  right: 35,
                                ),
                                child: TextFormField(
                                  controller: passwordController,
                                  autofocus: true,
                                  onSaved: (String value) {},
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.cancel),
                                      onPressed: () => passwordController.clear(),
                                    ),
                                    labelText: 'Password',
                                    hintText: 'Enter new Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                        SizedBox(height: 25.0),
                        !editAble
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Variables.phone_number,
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ],
                              )
                            : Padding(
                                padding:
                                    // const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                    const EdgeInsets.only(left: 35, right: 35),
                                child: TextFormField(
                                  controller: phoneNoController,
                                  autofocus: true,
                                  onSaved: (String value) {},
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.cancel),
                                      onPressed: () => phoneNoController.clear(),
                                    ),
                                    labelText: 'Phone No',
                                    hintText: 'Enter Phone Number',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                        SizedBox(height: 25.0),
                        !editAble
                            ? Container(
                                height: 45.0,
                                margin: EdgeInsets.symmetric(horizontal: 90),
                                // width: 50.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.greenAccent,
                                  color: Colors.green,
                                  elevation: 7.0,
                                  child: GestureDetector(
                                    onTap: () {
                                     updateUserData();
                                    },
                                    child: Center(
                                      child: Text(
                                        'Update',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                ))
                            : Container(),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }

Future updateUserData() async {
  await FlutterSession().get("userId").then((value) {
    print(value.toString());
    userRef.doc(value.toString()).update({
      "FirstName": firstNameController.text,
      "LastName": lastNameController.text,
      "Password": passwordController.text,
      "Phone No": phoneNoController.text,
    });
  });
}

}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

//==========this is function it self
}
