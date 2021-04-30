import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disability_application/home_page.dart';
import 'package:disability_application/login_screen.dart';
import 'package:disability_application/theme/colors.dart';
import 'package:disability_application/variables/variables.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'onboard_slider/intro_screeen.dart';
import 'top_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  dynamic status = await FlutterSession().get('status');
  String status2 = status.toString();


  getUserLoggedIn().then((value) => getUserById());
  runApp(
    MyApp(
      status: status2,
    ),
  );

}

Future getUserLoggedIn() async {

  dynamic getCurrentUser = await FlutterSession().get('Email');
  Variables.userLoggedIn = getCurrentUser.toString();
  print(Variables.userLoggedIn);
}


 getUserById() {

  final String id = Variables.userLoggedIn;
  final userRef = FirebaseFirestore.instance.collection('Users');

  userRef.doc(id).get().then((DocumentSnapshot doc) {

    Variables.first_name = (doc.data()['FirstName'].toString());
    Variables.last_name = (doc.data()['LastName'].toString());
    Variables.email = (doc.data()['Email'].toString());
    Variables.password = (doc.data()['Password'].toString());
    Variables.phone_number = (doc.data()['Phone No'].toString());
    Variables.gender = (doc.data()['Gender'].toString());
    Variables.disability = (doc.data()['Disability Type']).toString();
    Variables.dob = (doc.data()['DOB']).toString();
    Variables.nationality = (doc.data()['Nationality'].toString());
  });
  print(Variables.first_name);
  print(Variables.first_name);
  print(Variables.last_name);
  print(Variables.email);
  print(Variables.password);
  print(Variables.nationality);
  print(Variables.gender);
  print(Variables.dob);
  print(Variables.disability);
  print(Variables.phone_number);

}
class MyApp extends StatelessWidget {
  String status;

  MyApp({this.status});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curved Path',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      // home:status=='true' ? HomeScreen(): IntroScreen(),
      // home: IntroScreen(),
      home: LoginScreen(),
      // home: NewsHome(),
      // home: HomeScreen(),
    );
  }



}
