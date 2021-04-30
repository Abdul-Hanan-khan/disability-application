import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

final userRef = FirebaseFirestore.instance.collection('Users');

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  String userLoggedIn;
  String first_name;
  String last_name;
  String email;
  String password;
  String phone_number;
  String gender;
  String disability;
  String dob;
  String nationality;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedIn().then((value) =>getUserById() );


  }

  getUserById() {
    final String id = userLoggedIn;
    userRef.doc(id).get().then((DocumentSnapshot doc) {
      first_name = (doc.data()['FirstName'].toString());
      last_name = (doc.data()['LastName'].toString());
      email = (doc.data()['Email'].toString());
      password = (doc.data()['Password'].toString());
      phone_number = (doc.data()['Phone No'].toString());
      gender = (doc.data()['Gender'].toString());
      disability = (doc.data()['Disability Type']).toString();
      dob = (doc.data()['DOB']).toString();
      nationality = (doc.data()['Nationality'].toString());
      print(first_name);

      print(first_name);
      print(last_name);
      print(email);
      print(password);
      print(nationality);
      print(gender);
      print(dob);
      print(disability);
      print(phone_number);


      print(doc.exists);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text.rich(
        //   TextSpan(
        //     children: [
        //       TextSpan(
        //           text: 'Dis',
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 30,
        //               fontFamily: 'PaytoneOne')),
        //       TextSpan(
        //           text: 'ability',
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 30,
        //               fontFamily: 'Amaranth'
        //           )),
        //       TextSpan(
        //           text: ' App',
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 25,
        //               fontFamily: 'Amaranth'
        //           )),
        //     ],
        //   ),
        // ), backgroundColor: Colors.lightBlue,),

        appBar: AppBar(title: Text("Profile Setting"),),
      ),
    );
  }

  Future getUserLoggedIn()async{

    dynamic getCurrentUser=await FlutterSession().get('Email');
   setState(() {
     userLoggedIn=getCurrentUser.toString();
   });
    print(userLoggedIn);
  }


}